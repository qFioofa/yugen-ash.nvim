-- physical-keyboard.nvim — read-only floating dashboard (`:PhyKeyboardUI`)
-- Frame/sections/selection share the orange accent, the focused pane switches
-- the border to its own accent, active chips are gold, informational chips are
-- tide, values are bright and statuses follow the diagnostic roles.

local M = {}

function M.get(p, groups, styles)
	return {
		PhyKeyboardUINormal = { fg = p.color200, bg = p.color700 },
		PhyKeyboardUIBorder = { fg = p.primary, bg = p.color700 },
		PhyKeyboardUIBorderTree = { fg = p.primary, bg = p.color700 },
		PhyKeyboardUIBorderContent = { fg = p.tide, bg = p.color700 },
		PhyKeyboardUITitle = { fg = p.color800, bg = p.primary, style = "bold" },
		PhyKeyboardUIHeader = { bg = p.color700 },
		PhyKeyboardUISection = { fg = p.primary, style = "bold" },
		PhyKeyboardUISeparator = { fg = p.color500 },
		PhyKeyboardUIDivider = { fg = p.color500, bg = p.color700 },
		PhyKeyboardUITree = { fg = p.color300 },
		PhyKeyboardUITreeBranch = { fg = p.primary },
		PhyKeyboardUITreeSelected = { fg = p.color800, bg = p.primary, style = "bold" },
		PhyKeyboardUIFocus = { fg = p.color800, bg = p.gold, style = "bold" },
		PhyKeyboardUITreeActive = { fg = p.color100, style = "bold" },
		PhyKeyboardUIKey = { fg = p.tide },
		PhyKeyboardUIValue = { fg = p.color100 },
		PhyKeyboardUINumber = { fg = p.violet },
		PhyKeyboardUIBoolean = { fg = p.seafoam },
		PhyKeyboardUIMuted = { fg = p.color400 },
		PhyKeyboardUIHelp = { fg = p.color300, bg = p.color700 },
		PhyKeyboardUITab = { fg = p.color400 },
		PhyKeyboardUITabActive = { fg = p.color800, bg = p.gold, style = "bold" },
		PhyKeyboardUIBadge = { fg = p.color800, bg = p.tide, style = "bold" },
		PhyKeyboardUIOK = { fg = p.success, style = "bold" },
		PhyKeyboardUIWarn = { fg = p.warning, style = "bold" },
		PhyKeyboardUIError = { fg = p.error, style = "bold" },
		PhyKeyboardUIInfo = { fg = p.tide, style = "bold" },
		PhyKeyboardUIHint = { fg = p.seafoam, style = "bold" },
		PhyKeyboardUIVisual = { fg = p.color200, bg = p.color600 },
	}
end

return M
