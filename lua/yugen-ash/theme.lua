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
	"yugen-ash.groups.plugins.gitsigns",
	"yugen-ash.groups.plugins.nvimtree",
	"yugen-ash.groups.plugins.telescope",
	"yugen-ash.groups.plugins.noice",
	"yugen-ash.groups.plugins.cmp",
	"yugen-ash.groups.terminal",
}

function M.get(config)
	local variant = config.variant or "main"
	local p = require("yugen-ash.palette").get(variant)
	local groups = config.groups or {}
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
