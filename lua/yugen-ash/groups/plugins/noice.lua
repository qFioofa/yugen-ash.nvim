-- folke/noice.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		NoiceCmdlineIcon = { fg = p.primary },
		NoiceCmdlineIconSearch = { fg = p.crimson },
		NoiceCmdlineIconFilter = { fg = p.crimson },
		NoiceCmdlineIconLua = { fg = p.tide },
		NoiceCmdlinePopup = { fg = p.color200, bg = p.color700 },
		NoiceCmdlinePopupBorder = { fg = p.primary },
		NoiceCmdlinePopupBorderSearch = { fg = p.crimson, bg = p.color700 },
		NoiceCmdlinePopupTitle = { fg = p.color200, bg = p.color700 },
		NoiceCmdlinePopupBorderFilter = { fg = p.crimson, bg = p.color700 },
		NoiceCmdlinePopupBorderLua = { fg = p.tide, bg = p.color700 },
		NoiceCmdlinePopupTitleSearch = { fg = p.crimson, bg = p.color700 },
		NoiceCmdlinePopupTitleFilter = { fg = p.crimson, bg = p.color700 },
		NoiceCmdlinePopupTitleLua = { fg = p.crimson, bg = p.color700 },
		NoiceFormatProgressDone = { fg = p.primary, bg = p.color700 },
		NoiceFormatProgressTodo = { fg = p.color400, bg = p.color700 },
		NoiceLspProgressClient = { fg = p.color200 },
		NoiceLspProgressPlugin = { fg = p.color400 },
		NoiceLspProgressTitle = { fg = p.primary },
	}
end

return M
