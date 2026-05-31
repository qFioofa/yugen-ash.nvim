-- ggandor/leap.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		LeapMatch = { fg = p.color200, bg = p.color600, style = "bold" },
		LeapLabel = { fg = p.color800, bg = p.crimson, style = "bold" },
		LeapLabelPrimary = { fg = p.color800, bg = p.crimson, style = "bold" },
		LeapLabelSecondary = { fg = p.color800, bg = p.tide, style = "bold" },
		LeapBackdrop = { fg = p.color400 },
	}
end

return M
