-- echasnovski/mini.nvim (covers the commonly-themed modules)

local M = {}

function M.get(p, groups, styles)
	return {
		-- mini.statusline
		MiniStatuslineModeNormal = { fg = p.color800, bg = p.primary, style = "bold" },
		MiniStatuslineModeInsert = { fg = p.color800, bg = p.sage, style = "bold" },
		MiniStatuslineModeVisual = { fg = p.color800, bg = p.violet, style = "bold" },
		MiniStatuslineModeReplace = { fg = p.color800, bg = p.crimson, style = "bold" },
		MiniStatuslineModeCommand = { fg = p.color800, bg = p.gold, style = "bold" },
		MiniStatuslineModeOther = { fg = p.color800, bg = p.tide, style = "bold" },
		MiniStatuslineDevinfo = { fg = p.color200, bg = p.color600 },
		MiniStatuslineFilename = { fg = p.color300, bg = p.color700 },
		MiniStatuslineFileinfo = { fg = p.color200, bg = p.color600 },
		MiniStatuslineInactive = { fg = p.color400, bg = p.color700 },

		-- mini.tabline
		MiniTablineCurrent = { fg = p.color200, bg = p.color600, style = "bold" },
		MiniTablineVisible = { fg = p.color200, bg = p.color700 },
		MiniTablineHidden = { fg = p.color400, bg = p.color700 },
		MiniTablineModifiedCurrent = { fg = p.primary, bg = p.color600, style = "bold" },
		MiniTablineModifiedVisible = { fg = p.primary, bg = p.color700 },
		MiniTablineModifiedHidden = { fg = p.color400, bg = p.color700 },
		MiniTablineFill = { bg = p.color800 },

		-- mini.cursorword
		MiniCursorword = { bg = p.color600 },
		MiniCursorwordCurrent = { bg = p.color600 },

		-- mini.indentscope
		MiniIndentscopeSymbol = { fg = p.color400 },
		MiniIndentscopePrefix = { fg = p.none },

		-- mini.trailspace
		MiniTrailspace = { bg = p.error },

		-- mini.files
		MiniFilesNormal = { fg = p.color200, bg = p.color700 },
		MiniFilesBorder = { fg = groups.border },
		MiniFilesTitle = { fg = p.color400 },
		MiniFilesTitleFocused = { fg = p.primary, style = "bold" },

		-- mini.pick
		MiniPickNormal = { fg = p.color200, bg = p.color700 },
		MiniPickBorder = { fg = groups.border },
		MiniPickMatchCurrent = { bg = p.color600 },
		MiniPickMatchMarked = { fg = p.primary },
		MiniPickPrompt = { fg = p.primary },

		-- mini.starter
		MiniStarterHeader = { fg = p.primary },
		MiniStarterFooter = { fg = p.color400 },
		MiniStarterSection = { fg = p.tide },
		MiniStarterItem = { fg = p.color200 },
		MiniStarterItemPrefix = { fg = p.gold },
		MiniStarterItemBullet = { fg = p.color400 },
		MiniStarterCurrent = { bg = p.color600 },
	}
end

return M
