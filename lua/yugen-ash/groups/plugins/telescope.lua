-- nvim-telescope/telescope.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		TelescopeNormal = { fg = p.color200, bg = p.color700 },
		TelescopeSelection = { fg = p.color200, bg = p.color600 },
		TelescopeBorder = { fg = p.color500, bg = p.color700 },
		TelescopePromptNormal = { fg = p.color200, bg = p.color700 },
		TelescopePromptBorder = { fg = p.color500, bg = p.color700 },
		TelescopePromptTitle = { fg = p.color200, bg = p.color700 },
		TelescopePreviewTitle = { fg = p.color200, bg = p.color700 },
		TelescopeResultsTitle = { fg = p.color200, bg = p.color700 },
		TelescopeMatching = { fg = p.primary },
		TelescopeSelectionCaret = { fg = p.primary },
		TelescopePromptPrefix = { fg = p.primary },
	}
end

return M
