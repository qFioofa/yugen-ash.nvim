-- folke/noice.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		NoiceCmdlineIcon = { fg = p.primary },
		NoiceCmdlineIconSearch = { fg = p.crimson },
		NoiceCmdlineIconFilter = { fg = p.crimson },
		NoiceCmdlineIconLua = { fg = p.tide },
		NoiceCmdlinePopup = { fg = p.color200, bg = styles.panel },
		NoiceCmdlinePopupBorder = { fg = p.primary },
		NoiceCmdlinePopupBorderSearch = { fg = p.crimson, bg = styles.panel },
		NoiceCmdlinePopupTitle = { fg = p.color200, bg = styles.panel },
		NoiceCmdlinePopupBorderFilter = { fg = p.crimson, bg = styles.panel },
		NoiceCmdlinePopupBorderLua = { fg = p.tide, bg = styles.panel },
		NoiceCmdlinePopupTitleSearch = { fg = p.crimson, bg = styles.panel },
		NoiceCmdlinePopupTitleFilter = { fg = p.crimson, bg = styles.panel },
		NoiceCmdlinePopupTitleLua = { fg = p.crimson, bg = styles.panel },
		NoiceFormatProgressDone = { fg = p.primary, bg = styles.panel },
		NoiceFormatProgressTodo = { fg = p.color400, bg = styles.panel },
		NoiceLspProgressClient = { fg = p.color200 },
		NoiceLspProgressPlugin = { fg = p.color400 },
		NoiceLspProgressTitle = { fg = p.primary },
	}
end

return M
