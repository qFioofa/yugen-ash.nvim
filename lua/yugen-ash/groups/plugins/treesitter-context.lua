-- nvim-treesitter/nvim-treesitter-context

local M = {}

function M.get(p, groups, styles)
	return {
		TreesitterContext = { fg = p.color300, bg = p.color700 },
		TreesitterContextLineNumber = { fg = p.color400, bg = p.color700 },
		TreesitterContextBottom = { bg = p.color700, sp = p.color600, style = "underline" },
		TreesitterContextLineNumberBottom = { fg = p.color400, bg = p.color700, sp = p.color600, style = "underline" },
		TreesitterContextSeparator = { fg = groups.border, bg = p.color700 },
	}
end

return M
