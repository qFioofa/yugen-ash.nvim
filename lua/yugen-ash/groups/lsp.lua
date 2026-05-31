-- LSP references, codelens, and semantic token types

local M = {}

function M.get(p, groups, styles)
	return {
		LspReferenceText = { bg = p.color800 },
		LspReferenceRead = { bg = p.color400 },
		LspReferenceWrite = { bg = p.color800 },
		LspCodeLens = { fg = p.color400 },
		LspSignatureActiveParameter = { bg = p.placeholder, style = "bold" },
		lspTypeProperty = { fg = p.color500 },
		lspTypeParameter = { fg = p.color500, style = styles.italic },
		lspTypeVariable = { fg = p.color500 },
	}
end

return M
