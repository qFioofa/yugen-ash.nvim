-- Headless highlight coverage check for language fixtures.
--
-- Usage:
--   nvim -l tests/run.lua [language ...] [--all] [--variant NAME]
--                          [--report] [--verbose]
--
-- Without language arguments every entry in tests/manifest.lua is checked.
-- The script opens each fixture, enables legacy syntax and Treesitter (when
-- available), scans every buffer position with vim.inspect_pos, and compares
-- the groups actually seen with the groups declared by the language module.
-- Groups that cannot be reached without a live LSP server, or that the bundled
-- syntax/parser does not emit, must be documented in tests/expected/<lang>.lua.

local source = debug.getinfo(1, "S").source:sub(2)
local root = vim.fn.fnamemodify(source, ":p:h:h")

vim.opt.runtimepath:prepend(root)
dofile(root .. "/tests/parser_paths.lua").add()
vim.opt.termguicolors = true

local function parse_args(args)
	local opts = {
		languages = {},
		variant = "main",
		report = false,
		verbose = false,
	}

	local index = 1
	while index <= #args do
		local arg = args[index]
		if arg == "--all" then
			opts.all = true
		elseif arg == "--report" then
			opts.report = true
		elseif arg == "--verbose" then
			opts.verbose = true
		elseif arg == "--variant" then
			index = index + 1
			opts.variant = args[index]
		elseif arg == "--lang" then
			index = index + 1
			opts.languages[#opts.languages + 1] = args[index]
		elseif arg:sub(1, 1) ~= "-" then
			opts.languages[#opts.languages + 1] = arg
		else
			error("unknown argument: " .. arg)
		end
		index = index + 1
	end

	return opts
end

local function fs_stat(path)
	local stat = (vim.uv or vim.loop).fs_stat(path)
	return stat ~= nil
end

local function runtime_file(path)
	local ok, files = pcall(vim.api.nvim_get_runtime_file, path, false)
	return ok and files and #files > 0
end

local function parser_available(name)
	if not name or name == "" then
		return false
	end
	return pcall(vim.treesitter.language.add, name)
end

local function resolve_links(name)
	local out = { name }
	local current = name

	for _ = 1, 32 do
		local ok, hl = pcall(vim.api.nvim_get_hl, 0, {
			name = current,
			link = true,
			create = false,
		})
		if not ok or type(hl) ~= "table" or not hl.link then
			break
		end
		current = hl.link
		out[#out + 1] = current
	end

	return out
end

local function collect_groups(buf)
	local seen = {}
	local raw = {}

	local function add(name)
		if type(name) ~= "string" or name == "" then
			return
		end
		raw[name] = true
		for _, resolved in ipairs(resolve_links(name)) do
			seen[resolved] = true
		end

		-- Treesitter fallback: @a.b.lang -> @a.b -> @a.
		if name:sub(1, 1) == "@" then
			local parts = vim.split(name, ".", { plain = true })
			for i = #parts - 1, 1, -1 do
				local candidate = table.concat(parts, ".", 1, i)
				for _, resolved in ipairs(resolve_links(candidate)) do
					seen[resolved] = true
				end
			end
		end
	end

	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
	for row = 1, #lines do
		local line = lines[row]
		for col = 0, math.max(#line - 1, 0) do
			local ok, items = pcall(vim.inspect_pos, buf, row - 1, col, { extmarks = true })
			if not ok then
				ok, items = pcall(vim.inspect_pos, buf, row - 1, col)
			end
			if ok and type(items) == "table" then
				for _, capture in ipairs(items.treesitter or {}) do
					local group = capture.hl_group
					if not group and capture.capture then
						group = "@" .. capture.capture .. "." .. (capture.lang or "")
					end
					add(group)
				end
				for _, syntax in ipairs(items.syntax or {}) do
					add(syntax.hl_group)
				end
				for _, token in ipairs(items.semantic_tokens or {}) do
					add((token.opts or {}).hl_group)
				end
				for _, mark in ipairs(items.extmarks or {}) do
					local group = (mark.opts or {}).hl_group
					if type(group) == "string" then
						add(group)
					end
				end
			end
		end
	end

	return seen, raw
end

local function load_expected(id)
	local path = root .. "/tests/expected/" .. id .. ".lua"
	if not fs_stat(path) then
		return {}
	end

	local chunk, err = loadfile(path)
	if not chunk then
		print(("warning: cannot load %s: %s"):format(path, err))
		return {}
	end

	local ok, expected = pcall(chunk)
	if not ok or type(expected) ~= "table" then
		print(("warning: invalid allowlist %s"):format(path))
		return {}
	end

	return expected
end

local function declared_groups(lang, config)
	local p, groups, styles = require("yugen-ash.theme").context(config)
	local module = require("yugen-ash.groups.langs." .. lang.module)
	return module.get(p, groups, styles)
end

local function sorted_keys(tbl)
	local keys = {}
	for key in pairs(tbl) do
		keys[#keys + 1] = key
	end
	table.sort(keys)
	return keys
end

local function print_list(label, groups)
	if #groups == 0 then
		return
	end
	print(label .. ":")
	for _, group in ipairs(groups) do
		print("  " .. group)
	end
end

local function run_language(id, lang, opts, config)
	local fixture = root .. "/tests/fixtures/langs/" .. lang.file
	if not fs_stat(fixture) then
		print(("== %s =="):format(id))
		print("missing fixture: " .. fixture)
		return false, true
	end

	vim.cmd("edit " .. vim.fn.fnameescape(fixture))
	local buf = vim.api.nvim_get_current_buf()
	pcall(vim.treesitter.stop, buf)

	vim.bo[buf].filetype = lang.filetype
	for key, value in pairs(lang.vim_g or {}) do
		vim.g[key] = value
	end

	-- vim.treesitter.start() clears 'syntax', so load legacy syntax afterwards.
	local parser_ok = false
	if parser_available(lang.parser) then
		local ok, started = pcall(vim.treesitter.start, buf, lang.parser)
		parser_ok = ok and started ~= false
	end
	if parser_ok then
		local highlighter = vim.treesitter.highlighter.active[buf]
		if highlighter then
			-- Headless Neovim does not redraw, so force the initial parse.
			pcall(highlighter.tree.parse, highlighter.tree)
		end
	end

	local syntax_ok = false
	if lang.syntax and runtime_file("syntax/" .. lang.syntax .. ".vim") then
		local ok = pcall(vim.cmd, "runtime! syntax/" .. lang.syntax .. ".vim")
		syntax_ok = ok
	end

	local seen = collect_groups(buf)
	local declared = declared_groups(lang, config)
	local expected = load_expected(id)
	local allowlisted = expected.unreachable or {}

	local demonstrated = {}
	local missing = {}
	local lsp_only = {}
	local skipped = {}

	for group in pairs(declared) do
		if seen[group] then
			demonstrated[#demonstrated + 1] = group
		elseif group:match("^@lsp%.") then
			lsp_only[#lsp_only + 1] = group
		elseif allowlisted[group] then
			skipped[#skipped + 1] = group
		elseif group:sub(1, 1) == "@" and not parser_ok then
			skipped[#skipped + 1] = group
		elseif group:sub(1, 1) ~= "@" and not syntax_ok then
			skipped[#skipped + 1] = group
		else
			missing[#missing + 1] = group
		end
	end

	local common_missing = {}
	for _, group in ipairs(lang.common or {}) do
		if not seen[group] then
			local parser_group = group:sub(1, 1) == "@"
			if not (parser_group and not parser_ok) and not (not parser_group and not syntax_ok) then
				common_missing[#common_missing + 1] = group
			end
		end
	end

	local stale_allowlist = {}
	for group in pairs(allowlisted) do
		if not declared[group] then
			stale_allowlist[#stale_allowlist + 1] = group .. " (not declared)"
		elseif seen[group] then
			stale_allowlist[#stale_allowlist + 1] = group .. " (demonstrated)"
		end
	end

	table.sort(demonstrated)
	table.sort(missing)
	table.sort(lsp_only)
	table.sort(skipped)
	table.sort(common_missing)
	table.sort(stale_allowlist)

	print(("== %s =="):format(id))
	print(("fixture: %s"):format(vim.fn.fnamemodify(fixture, ":.")))
	print(("filetype=%s parser=%s syntax=%s"):format(lang.filetype, lang.parser or "-", lang.syntax or "-"))
	print(("syntax: %s"):format(syntax_ok and "loaded" or "SKIP (not found)"))
	print(("parser: %s"):format(parser_ok and "started" or "SKIP (not installed)"))
	print(
		("declared=%d demonstrated=%d lsp-only=%d allowlisted/skipped=%d missing=%d"):format(
			#sorted_keys(declared),
			#demonstrated,
			#lsp_only,
			#skipped,
			#missing
		)
	)

	print_list("missing", missing)
	print_list("common missing", common_missing)
	print_list("stale allowlist", stale_allowlist)
	if opts.verbose then
		print_list("demonstrated", demonstrated)
		print_list("lsp-only", lsp_only)
		print_list("allowlisted/skipped", skipped)
	end

	return #missing == 0 and #common_missing == 0 and #stale_allowlist == 0, #stale_allowlist > 0
end

local opts = parse_args(_G.arg or {})
local manifest = dofile(root .. "/tests/manifest.lua")

require("yugen-ash").setup({
	compile = false,
	variant = opts.variant,
})
vim.cmd("colorscheme yugen-ash")
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

local config = require("yugen-ash").get_config()
local languages = {}
if opts.all or #opts.languages == 0 then
	languages = sorted_keys(manifest)
else
	languages = opts.languages
end

local failed = false
local had_error = false
for _, id in ipairs(languages) do
	local lang = manifest[id]
	if not lang then
		print(("== %s =="):format(id))
		print("unknown language: " .. id)
		failed = true
		had_error = true
	else
		local ok, is_error = run_language(id, lang, opts, config)
		if not ok then
			failed = true
			had_error = had_error or is_error
		end
	end
end

io.stdout:write("\n")
io.stdout:flush()

if had_error or (failed and not opts.report) then
	vim.cmd("cq")
else
	vim.cmd("qa!")
end
