-- echasnovski/mini.nvim (covers the commonly-themed modules)

local M = {}

function M.get(p, groups, styles)
	return {
		-- mini.statusline
		MiniStatuslineModeNormal = { fg = p.color800, bg = p.crimson, style = styles.bold },
		MiniStatuslineModeInsert = { fg = p.color800, bg = p.success, style = styles.bold },
		MiniStatuslineModeVisual = { fg = p.color800, bg = p.warning, style = styles.bold },
		MiniStatuslineModeReplace = { fg = p.color800, bg = p.error, style = styles.bold },
		MiniStatuslineModeCommand = { fg = p.color800, bg = p.amber, style = styles.bold },
		MiniStatuslineModeOther = { fg = p.color800, bg = p.seafoam, style = styles.bold },
		MiniStatuslineDevinfo = { fg = p.color200, bg = p.color600 },
		MiniStatuslineFilename = { fg = p.color300, bg = styles.statusline },
		MiniStatuslineFileinfo = { fg = p.color200, bg = p.color600 },
		MiniStatuslineInactive = { fg = p.color400, bg = styles.statusline },

		-- mini.tabline
		MiniTablineCurrent = { fg = p.color200, bg = p.color600, style = styles.bold },
		MiniTablineVisible = { fg = p.color200, bg = styles.panel },
		MiniTablineHidden = { fg = p.color400, bg = styles.background },
		MiniTablineModifiedCurrent = { fg = p.primary, bg = p.color600, style = styles.bold },
		MiniTablineModifiedVisible = { fg = p.primary, bg = styles.panel },
		MiniTablineModifiedHidden = { fg = p.color400, bg = styles.background },
		MiniTablineFill = { bg = styles.statusline },

		-- mini.cursorword
		MiniCursorword = { bg = p.color600 },
		MiniCursorwordCurrent = { bg = p.color600 },

		-- mini.indentscope
		MiniIndentscopeSymbol = { fg = p.color400 },
		MiniIndentscopePrefix = { fg = p.none },

		-- mini.trailspace
		MiniTrailspace = { bg = groups.error },

		-- mini.files
		MiniFilesNormal = { fg = p.color200, bg = styles.panel },
		MiniFilesBorder = { fg = groups.border },
		MiniFilesTitle = { fg = p.color400 },
		MiniFilesTitleFocused = { fg = p.primary, style = styles.bold },

		-- mini.pick
		MiniPickNormal = { fg = p.color200, bg = styles.panel },
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
