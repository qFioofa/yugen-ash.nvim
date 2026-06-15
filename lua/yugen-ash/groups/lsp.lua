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

		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.interface"] = { link = "@type" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.namespace"] = { link = "@type" },
		["@lsp.type.builtinType"] = { link = "@type.builtin" },
		["@lsp.type.typeParameter"] = { fg = p.amber, style = styles.italic },
		["@lsp.type.decorator"] = { fg = p.amber, style = styles.italic },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@method" },
		["@lsp.type.macro"] = { link = "@function.macro" },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.variable"] = { link = "@variable" },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.string"] = { link = "@string" },
		["@lsp.type.number"] = { fg = p.violet },
		["@lsp.type.operator"] = { link = "@operator" },

		-- Token modifiers: builtins, constants and deprecations.
		["@lsp.typemod.variable.readonly"] = { link = "@constant" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.variable.globalScope"] = { link = "@constant" },
		["@lsp.mod.deprecated"] = { style = "strikethrough" },
	}
end

return M
