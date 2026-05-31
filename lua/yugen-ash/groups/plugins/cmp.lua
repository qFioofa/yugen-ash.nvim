-- hrsh7th/nvim-cmp

local M = {}

function M.get(p, groups, styles)
	return {
		CmpItemAbbr = { fg = p.color200 },
		CmpItemAbbrMatch = { fg = p.color300, style = "bold" },
		CmpItemKind = { fg = p.primary },
		CmpItemMenu = { fg = p.color400 },
	}
end

return M
