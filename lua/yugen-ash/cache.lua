-- Theme compilation cache.
--
-- Building the theme means requiring ~60 group modules, resolving the palette,
-- merging tables and translating every spec to nvim_set_hl args. That work is
-- deterministic for a given config, so we do it once, serialize the resulting
-- highlight map to a Lua file under stdpath("cache"), and reload it directly on
-- subsequent startups. The cache is keyed by the config and invalidated when
-- any theme source file changes (newest mtime fingerprint), so editing the
-- theme transparently triggers a recompile.

local utils = require("yugen-ash.utils")

local M = {}

-- Directory containing the theme's Lua sources (this file lives at its root).
local source_root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")

local function cache_root()
	return vim.fn.stdpath("cache") .. "/yugen-ash"
end

-- Newest mtime across all theme sources; changes whenever a file is edited.
local function fingerprint()
	local newest = 0
	for _, file in ipairs(vim.fn.glob(source_root .. "/**/*.lua", true, true)) do
		local mtime = vim.fn.getftime(file)
		if mtime > newest then
			newest = mtime
		end
	end
	return newest
end

local function cache_path(config)
	return cache_root() .. "/" .. vim.fn.sha256(vim.inspect(config)) .. ".lua"
end

-- Build the theme for `config` and write the compiled payload to `path`.
function M.compile(config, path, fp)
	path = path or cache_path(config)
	fp = fp or fingerprint()

	-- theme.get sets vim.g.terminal_color_* as a side effect; capture those too.
	local theme = require("yugen-ash.theme").get(config)
	for group, color in pairs(config.highlight_groups or {}) do
		theme[group] = color
	end

	local highlights = {}
	for group, color in pairs(theme) do
		highlights[group] = utils.to_hl(color)
	end

	local terminal = {}
	for i = 0, 15 do
		terminal[i] = vim.g["terminal_color_" .. i]
	end

	local payload = { fingerprint = fp, highlights = highlights, terminal = terminal }

	vim.fn.mkdir(cache_root(), "p")
	local file = io.open(path, "w")
	if file then
		file:write("return " .. vim.inspect(payload))
		file:close()
	end

	return payload
end

-- Return the compiled payload for `config`, recompiling if the cache is missing
-- or stale.
function M.load(config)
	local path = cache_path(config)
	local fp = fingerprint()

	local ok, payload = pcall(dofile, path)
	if ok and type(payload) == "table" and payload.fingerprint == fp then
		return payload
	end

	return M.compile(config, path, fp)
end

-- Remove all compiled caches.
function M.clean()
	vim.fn.delete(cache_root(), "rf")
end

return M
