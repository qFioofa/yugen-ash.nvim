-- Theme generator with variant support.
-- Resolves the palette/styles for the active variant, then aggregates the
-- highlight-group modules under groups/. Each module exposes
-- `get(p, groups, styles)` and returns its slice of highlight groups.

local M = {}

-- Highlight-group modules, merged in order. Keys are unique across modules,
-- so order only affects readability, not the resulting theme.
local modules = {
	"yugen-ash.groups.ui",
	"yugen-ash.groups.syntax",
	"yugen-ash.groups.diagnostics",
	"yugen-ash.groups.treesitter",
	"yugen-ash.groups.lsp",
	"yugen-ash.groups.markdown",
	"yugen-ash.groups.langs.c",
	"yugen-ash.groups.langs.javascript",
	"yugen-ash.groups.langs.typescript",
	"yugen-ash.groups.langs.svelte",
	"yugen-ash.groups.langs.zig",
	"yugen-ash.groups.langs.elixir",
	"yugen-ash.groups.langs.java",
	"yugen-ash.groups.langs.bash",
	"yugen-ash.groups.langs.python",
	"yugen-ash.groups.langs.nix",
	"yugen-ash.groups.langs.css",
	"yugen-ash.groups.langs.html",
	"yugen-ash.groups.langs.csharp",
	"yugen-ash.groups.langs.yaml",
	"yugen-ash.groups.langs.toml",
	"yugen-ash.groups.langs.rust",
	"yugen-ash.groups.langs.go",
	"yugen-ash.groups.langs.json",
	"yugen-ash.groups.langs.kotlin",
	"yugen-ash.groups.langs.sql",
	"yugen-ash.groups.langs.dockerfile",
	"yugen-ash.groups.langs.latex",
	"yugen-ash.groups.langs.make",
	"yugen-ash.groups.langs.cmake",
	"yugen-ash.groups.langs.protobuf",
	"yugen-ash.groups.langs.powershell",
	"yugen-ash.groups.langs.erlang",
	"yugen-ash.groups.plugins.gitsigns",
	"yugen-ash.groups.plugins.nvimtree",
	"yugen-ash.groups.plugins.telescope",
	"yugen-ash.groups.plugins.noice",
	"yugen-ash.groups.plugins.cmp",
	"yugen-ash.groups.plugins.flash",
	"yugen-ash.groups.plugins.leap",
	"yugen-ash.groups.plugins.which-key",
	"yugen-ash.groups.plugins.illuminate",
	"yugen-ash.groups.plugins.trouble",
	"yugen-ash.groups.plugins.todo-comments",
	"yugen-ash.groups.plugins.navic",
	"yugen-ash.groups.plugins.aerial",
	"yugen-ash.groups.plugins.neogit",
	"yugen-ash.groups.plugins.diffview",
	"yugen-ash.groups.plugins.notify",
	"yugen-ash.groups.plugins.dap",
	"yugen-ash.groups.plugins.mason",
	"yugen-ash.groups.plugins.mini",
	"yugen-ash.groups.plugins.render-markdown",
	"yugen-ash.groups.plugins.blink-cmp",
	"yugen-ash.groups.terminal",
}

-- Resolve palette-name references in the user-facing `groups` table to concrete
-- colors against the active palette. Values may be palette keys ("color800",
-- "sage"), a literal hex string ("#1a1a1a") or "none"; anything not present in
-- the palette is passed through unchanged. Nested tables (e.g. `headings`)
-- recurse. Without this, palette names like "color600" never resolve (the
-- palette module only exposes `get`), leaving borders/panels uncolored.
local function resolve_groups(groups, p)
	local resolved = {}
	for key, value in pairs(groups) do
		if type(value) == "table" then
			resolved[key] = resolve_groups(value, p)
		elseif type(value) == "string" then
			resolved[key] = p[value] or value
		else
			resolved[key] = value
		end
	end
	return resolved
end

function M.get(config)
	local variant = config.variant or "main"
	local p = require("yugen-ash.palette").get(variant)
	local groups = resolve_groups(config.groups or {}, p)
	local styles = {
		italic = config.disable_italics and p.none or "italic",
		vert_split = config.bold_vert_split and groups.border or p.none,
		background = config.transparent and p.none or groups.background,
		float_background = config.transparent_statusline and p.none or groups.panel,
	}
	styles.nc_background = (config.dim_nc_background and not config.transparent and groups.panel) or styles.background

	local theme = {}
	for _, name in ipairs(modules) do
		for group, color in pairs(require(name).get(p, groups, styles)) do
			theme[group] = color
		end
	end

	return theme
end

return M
