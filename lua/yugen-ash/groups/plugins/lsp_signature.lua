-- ray-x/lsp_signature.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		LspSignatureActiveParameter = { bg = p.placeholder, style = styles.bold },
		FloatShadow = { bg = p.color800 },
		FloatShadowThrough = { bg = p.color800 },
	}
end

return M
