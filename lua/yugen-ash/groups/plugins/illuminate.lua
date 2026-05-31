-- RRethy/vim-illuminate (mirrors the LSP reference highlights)

local M = {}

function M.get(p, groups, styles)
	return {
		IlluminatedWordText = { link = "LspReferenceText" },
		IlluminatedWordRead = { link = "LspReferenceRead" },
		IlluminatedWordWrite = { link = "LspReferenceWrite" },
	}
end

return M
