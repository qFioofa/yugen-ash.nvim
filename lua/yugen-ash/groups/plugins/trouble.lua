-- folke/trouble.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		TroubleText = { fg = p.color200 },
		TroubleCount = { fg = p.primary, bg = p.color600 },
		TroubleNormal = { fg = p.color200, bg = p.color700 },
		TroubleNormalNC = { fg = p.color200, bg = p.color700 },
	}
end

return M
