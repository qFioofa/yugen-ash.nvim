-- williamboman/mason.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		MasonHeader = { fg = p.color800, bg = p.primary, style = "bold" },
		MasonHeaderSecondary = { fg = p.color800, bg = p.gold, style = "bold" },
		MasonHighlight = { fg = p.primary },
		MasonHighlightBlock = { fg = p.color800, bg = p.primary },
		MasonHighlightBlockBold = { fg = p.color800, bg = p.primary, style = "bold" },
		MasonMuted = { fg = p.color400 },
		MasonMutedBlock = { fg = p.color200, bg = p.color600 },
		MasonError = { fg = p.error },
		MasonWarning = { fg = p.warning },
		MasonHeading = { fg = p.color200, style = "bold" },
		MasonNormal = { fg = p.color200, bg = p.color700 },
	}
end

return M
