-- Read-only highlight inspector.
--
-- The public entrypoint is :YugenAshInspect [group]. It must never call
-- nvim_set_hl, nvim_set_hl_ns, or create highlight groups.

local M = {}

local priorities = (vim.hl and vim.hl.priorities) or {
	syntax = 50,
	treesitter = 100,
	semantic_tokens = 125,
	diagnostics = 150,
	user = 200,
}

local attributes = {
	"bold",
	"italic",
	"underline",
	"undercurl",
	"underdouble",
	"underdotted",
	"underdashed",
	"strikethrough",
	"reverse",
	"standout",
	"nocombine",
}

local function get_hl(group, link)
	local opts = { link = link, create = false }
	if type(group) == "number" then
		opts.id = group
	else
		opts.name = group
	end

	local ok, hl = pcall(vim.api.nvim_get_hl, 0, opts)
	if ok then
		return hl or {}
	end

	-- Older Neovim: nvim_get_hl may not support create = false.
	if type(group) ~= "string" or vim.fn.hlexists(group) == 0 then
		return {}
	end
	opts.create = nil
	local ok2, hl2 = pcall(vim.api.nvim_get_hl, 0, opts)
	return ok2 and (hl2 or {}) or {}
end

local function group_name(group)
	if type(group) == "string" then
		return group
	end
	local ok, name = pcall(vim.fn.synIDattr, vim.fn.synIDtrans(group), "name")
	return ok and name or tostring(group)
end

local function hex(value)
	if type(value) == "number" then
		return string.format("#%06X", value)
	end
	if type(value) == "string" and value ~= "" then
		return value
	end
	return nil
end

local function hl_summary(hl)
	local parts = {}
	if hl.fg then
		parts[#parts + 1] = "fg=" .. (hex(hl.fg) or tostring(hl.fg))
	end
	if hl.bg then
		parts[#parts + 1] = "bg=" .. (hex(hl.bg) or tostring(hl.bg))
	end
	if hl.sp then
		parts[#parts + 1] = "sp=" .. (hex(hl.sp) or tostring(hl.sp))
	end
	for _, attr in ipairs(attributes) do
		if hl[attr] then
			parts[#parts + 1] = attr
		end
	end
	if hl.blend then
		parts[#parts + 1] = "blend=" .. tostring(hl.blend)
	end
	if #parts == 0 then
		return "empty"
	end
	return table.concat(parts, " ")
end

local function echo(lines)
	local chunks = {}
	for _, line in ipairs(lines) do
		chunks[#chunks + 1] = { line }
		chunks[#chunks + 1] = { "\n" }
	end
	vim.api.nvim_echo(chunks, false, {})
end

local function manual_items(buf, row, col)
	local items = {
		treesitter = {},
		syntax = {},
		extmarks = {},
		semantic_tokens = {},
		buffer = buf,
		row = row,
		col = col,
	}

	if vim.treesitter.get_captures_at_pos then
		local ok, captures = pcall(vim.treesitter.get_captures_at_pos, buf, row, col)
		if ok then
			for _, capture in ipairs(captures or {}) do
				capture.hl_group = "@" .. capture.capture .. "." .. capture.lang
				items.treesitter[#items.treesitter + 1] = capture
			end
		end
	end

	local ok, stack = pcall(vim.fn.synstack, row + 1, col + 1)
	if ok then
		for _, id in ipairs(stack) do
			items.syntax[#items.syntax + 1] = { hl_group = vim.fn.synIDattr(id, "name") }
		end
	end

	local nsmap = {}
	for name, id in pairs(vim.api.nvim_get_namespaces()) do
		nsmap[id] = name
	end

	local ok2, marks = pcall(vim.api.nvim_buf_get_extmarks, buf, -1, { row, col }, { row, col }, {
		details = true,
		overlap = true,
	})
	if ok2 then
		for _, mark in ipairs(marks) do
			local opts = mark[4] or {}
			local ns = nsmap[opts.ns_id] or ""
			local extmark = {
				id = mark[1],
				row = mark[2],
				col = mark[3],
				opts = opts,
				ns_id = opts.ns_id,
				ns = ns,
			}
			if ns:find("nvim.lsp.semantic_tokens", 1, true) == 1 then
				items.semantic_tokens[#items.semantic_tokens + 1] = extmark
			else
				items.extmarks[#items.extmarks + 1] = extmark
			end
		end
	end

	return items
end

local function inspect_items(buf, row, col, all_extmarks)
	local filter = { extmarks = all_extmarks and "all" or true }
	local ok, items = pcall(vim.inspect_pos, buf, row, col, filter)
	if ok then
		return items
	end
	if all_extmarks then
		local ok2, items2 = pcall(vim.inspect_pos, buf, row, col, { extmarks = true })
		if ok2 then
			return items2
		end
	end
	return manual_items(buf, row, col)
end

local function tree_priority(capture)
	local metadata = capture.metadata or {}
	local value = metadata.priority
	if not value and metadata[capture.id] then
		value = metadata[capture.id].priority
	end
	return value or priorities.treesitter
end

function M.candidates(items)
	local out = {}
	local seen = {}
	local buf = items.buffer

	local function add(entry)
		if entry.group == nil then
			return
		end
		local key = table.concat({
			tostring(entry.source),
			tostring(entry.group),
			tostring(entry.priority),
		}, ":")
		if seen[key] then
			return
		end
		seen[key] = true
		out[#out + 1] = entry
	end

	for _, capture in ipairs(items.treesitter or {}) do
		add({
			source = "treesitter",
			group = capture.hl_group or ("@" .. capture.capture .. "." .. capture.lang),
			link = capture.hl_group_link,
			priority = tree_priority(capture),
			lang = capture.lang,
			capture = capture.capture,
		})
	end

	for _, token in ipairs(items.semantic_tokens or {}) do
		local opts = token.opts or {}
		add({
			source = token.ns ~= "" and token.ns or "semantic_tokens",
			group = opts.hl_group,
			priority = opts.priority or priorities.semantic_tokens,
			ns = token.ns,
		})
	end

	if vim.lsp and vim.lsp.semantic_tokens and vim.lsp.semantic_tokens.get_at_pos then
		local ok, tokens = pcall(vim.lsp.semantic_tokens.get_at_pos, buf, items.row, items.col)
		if ok then
			local ft = vim.bo[buf].filetype
			for _, token in ipairs(tokens or {}) do
				add({
					source = "lsp.type",
					group = string.format("@lsp.type.%s.%s", token.type, ft),
					priority = priorities.semantic_tokens,
				})
				for modifier in pairs(token.modifiers or {}) do
					add({
						source = "lsp.mod",
						group = string.format("@lsp.mod.%s.%s", modifier, ft),
						priority = priorities.semantic_tokens + 1,
					})
					add({
						source = "lsp.typemod",
						group = string.format("@lsp.typemod.%s.%s.%s", token.type, modifier, ft),
						priority = priorities.semantic_tokens + 2,
					})
				end
			end
		end
	end

	for _, extmark in ipairs(items.extmarks or {}) do
		local opts = extmark.opts or {}
		if opts.hl_group then
			add({
				source = extmark.ns ~= "" and extmark.ns or "extmark",
				group = group_name(opts.hl_group),
				priority = opts.priority or 0,
				ns = extmark.ns,
			})
		end
	end

	for _, syntax in ipairs(items.syntax or {}) do
		add({
			source = "syntax",
			group = syntax.hl_group,
			link = syntax.hl_group_link,
			priority = priorities.syntax,
		})
	end

	return out
end

function M.resolve(group)
	local link = get_hl(group, true)
	local hl = get_hl(group, false)
	local name = group_name(group)
	local chain = {}
	local seen = {}
	local current = group
	local target = link.link

	while target and not seen[tostring(current)] do
		seen[tostring(current)] = true
		chain[#chain + 1] = string.format("%s -> %s", group_name(current), group_name(target))
		current = target
		target = get_hl(current, true).link
	end

	return {
		group = name,
		link = link,
		hl = hl,
		chain = chain,
		final = group_name(current),
	}
end

function M.resolve_with_fallback(group)
	local resolved = M.resolve(group)
	if next(resolved.hl) ~= nil then
		return resolved
	end
	if type(group) ~= "string" or group:sub(1, 1) ~= "@" then
		return resolved
	end

	local parts = vim.split(group, ".", { plain = true })
	for i = #parts - 1, 1, -1 do
		local candidate = table.concat(parts, ".", 1, i)
		local fallback = M.resolve(candidate)
		if next(fallback.hl) ~= nil then
			fallback.fallback_from = group
			return fallback
		end
	end

	return resolved
end

function M.effective(hl, fallback_group)
	local fallback = get_hl(fallback_group or "Normal", false)
	local out = vim.deepcopy(hl)
	out.fg = out.fg or fallback.fg
	out.bg = out.bg or fallback.bg
	if out.reverse then
		out.fg, out.bg = out.bg, out.fg
		out.reverse = nil
	end
	return out, fallback
end

local function winhl_map(win)
	local map = {}
	local value = vim.api.nvim_get_option_value("winhighlight", { win = win })
	for pair in value:gmatch("[^,]+") do
		local from, to = pair:match("([^:]+):(.+)")
		if from and to then
			map[from] = to
		end
	end
	return map
end

local function sort_candidates(candidates)
	table.sort(candidates, function(left, right)
		if left.priority == right.priority then
			return tostring(left.group) < tostring(right.group)
		end
		return left.priority < right.priority
	end)
end

local function merge_candidates(candidates)
	local merged = {}
	local winner = nil
	local winner_priority = -math.huge

	for _, candidate in ipairs(candidates) do
		local resolved = M.resolve_with_fallback(candidate.group)
		for key, value in pairs(resolved.hl) do
			if key ~= "cterm" and value ~= nil then
				merged[key] = value
			end
		end
		if candidate.priority > winner_priority then
			winner_priority = candidate.priority
			winner = candidate
		end
	end

	return merged, winner
end

function M.show_position(opts)
	opts = opts or {}
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(win)
	local row, col = cursor[1] - 1, cursor[2]
	local items = inspect_items(buf, row, col, opts.all_extmarks)
	local candidates = M.candidates(items)
	sort_candidates(candidates)

	local lines = {
		string.format(
			"yugen-ash inspect: buffer %d, row %d, col %d, ft=%s",
			buf,
			row,
			col,
			vim.bo[buf].filetype
		),
	}

	local map = winhl_map(win)
	local winhl = vim.api.nvim_get_option_value("winhighlight", { win = win })
	if winhl ~= "" then
		lines[#lines + 1] = "winhl: " .. winhl
	end

	for _, candidate in ipairs(candidates) do
		local name = group_name(candidate.group)
		candidate.group = map[name] or candidate.group
	end
	sort_candidates(candidates)

	if #candidates == 0 then
		lines[#lines + 1] = "no highlight groups at this position"
	else
		for _, candidate in ipairs(candidates) do
			local resolved = M.resolve_with_fallback(candidate.group)
			local parts = {
				string.format("%s", candidate.source),
				string.format("%s", resolved.group),
				string.format("priority=%d", candidate.priority),
				hl_summary(resolved.hl),
			}
			if resolved.fallback_from then
				parts[#parts + 1] = "(empty; fallback from " .. resolved.fallback_from .. ")"
			end
			if #resolved.chain > 0 then
				parts[#parts + 1] = "link: " .. table.concat(resolved.chain, ", ")
			elseif resolved.link.link then
				parts[#parts + 1] = "link: " .. tostring(resolved.link.link)
			end
			local mapped = map[resolved.group]
			if mapped then
				parts[#parts + 1] = "winhl -> " .. mapped
			end
			lines[#lines + 1] = "  " .. table.concat(parts, "  ")
		end
	end

	if opts.all_extmarks then
		for _, extmark in ipairs(items.extmarks or {}) do
			local extmark_opts = extmark.opts or {}
			if not extmark_opts.hl_group then
				local ns = extmark.ns ~= "" and extmark.ns or "<anonymous>"
				lines[#lines + 1] = "  extmark " .. ns .. " (no hl_group)"
			end
		end
	end

	local merged, winner = merge_candidates(candidates)
	local fallback_group = map["Normal"] or "Normal"
	local effective, fallback = M.effective(merged, fallback_group)
	if winner then
		local mapped = map[group_name(winner.group)] or group_name(winner.group)
		lines[#lines + 1] = string.format(
			"winner: %s  priority=%d  mapped=%s",
			winner.group,
			winner.priority,
			mapped
		)
	end
	lines[#lines + 1] = "merged: " .. hl_summary(effective)
	lines[#lines + 1] = string.format("fallback (%s): %s", fallback_group, hl_summary(fallback))

	echo(lines)
end

function M.show_group(group)
	local resolved = M.resolve_with_fallback(group)
	local lines = { "yugen-ash inspect: " .. resolved.group }

	if #resolved.chain > 0 then
		lines[#lines + 1] = "link chain: " .. table.concat(resolved.chain, ", ")
	else
		lines[#lines + 1] = "link: none"
	end

	if resolved.fallback_from then
		lines[#lines + 1] = "fallback from: " .. resolved.fallback_from
	end

	local definition = resolved.link.link and ("link -> " .. tostring(resolved.link.link))
		or hl_summary(resolved.link)
	lines[#lines + 1] = "definition: " .. definition
	lines[#lines + 1] = "resolved: " .. hl_summary(resolved.hl)
	lines[#lines + 1] = "effective: " .. hl_summary(M.effective(resolved.hl))

	local ok, output = pcall(vim.api.nvim_exec2, "verbose hi " .. resolved.group, { output = true })
	if ok and output and output.output and output.output ~= "" then
		for line in output.output:gmatch("[^\n]+") do
			lines[#lines + 1] = "hi: " .. line
		end
	end

	echo(lines)
end

function M.show(group, bang)
	if group and group ~= "" then
		M.show_group(group)
		return
	end
	M.show_position({ all_extmarks = bang })
end

return M
