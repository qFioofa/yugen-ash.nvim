-- Elixir language groups (.ex / .exs) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy vim-elixir syntax groups
		elixirKeyword = { fg = p.crimson },
		elixirDefine = { fg = p.crimson },
		elixirPrivateDefine = { fg = p.crimson },
		elixirModuleDefine = { fg = p.crimson },
		elixirProtocolDefine = { fg = p.crimson },
		elixirImplDefine = { fg = p.crimson },
		elixirRecordDefine = { fg = p.crimson },
		elixirStructDefine = { fg = p.crimson },
		elixirExceptionDefine = { fg = p.crimson },
		elixirCallbackDefine = { fg = p.crimson },
		elixirGuard = { fg = p.tide },
		elixirBlockDefinition = { fg = p.crimson },
		elixirDefjp = { fg = p.crimson },
		elixirInclude = { fg = p.violet },
		elixirImport = { fg = p.violet },
		elixirOperator = { fg = p.frost },
		elixirModuleDeclaration = { fg = p.gold },
		elixirAlias = { fg = p.gold },
		elixirAtom = { fg = p.seafoam },
		elixirAtomMapKey = { fg = p.seafoam },
		elixirMapDelimiter = { fg = p.color400 },
		elixirVariable = { fg = p.color200 },
		elixirString = { fg = p.sage },
		elixirStringDelimiter = { fg = p.sage },
		elixirCharList = { fg = p.sage },
		elixirSigil = { fg = p.coral },
		elixirSigilDelimiter = { fg = p.coral },
		elixirInterpolation = { fg = p.coral },
		elixirInterpolationDelimiter = { fg = p.coral },
		elixirDocString = { fg = p.color400 },
		elixirDocSigilDelimiter = { fg = p.color400 },
		elixirComment = { fg = p.color400 },
		elixirRegex = { fg = p.coral },
		elixirBoolean = { fg = p.tide },
		elixirNil = { fg = p.violet },
		elixirNumber = { fg = p.violet },
		elixirSelf = { fg = p.color300 },
		elixirUnusedVariable = { fg = p.color400 },
		elixirModuleAttribute = { fg = p.amber },
		elixirDocTest = { fg = p.color400 },

		-- Elixir Treesitter
		["@keyword.elixir"] = { fg = p.crimson },
		["@keyword.function.elixir"] = { fg = p.crimson },
		["@keyword.import.elixir"] = { fg = p.violet },
		["@function.elixir"] = { fg = p.primary },
		["@function.call.elixir"] = { fg = p.primary },
		["@module.elixir"] = { fg = p.gold },
		["@type.elixir"] = { fg = p.gold },
		["@constant.elixir"] = { fg = p.seafoam },
		["@constant.builtin.elixir"] = { fg = p.violet },
		["@string.special.symbol.elixir"] = { fg = p.seafoam },
		["@string.special.elixir"] = { fg = p.coral },
		["@variable.member.elixir"] = { fg = p.seafoam },
		["@attribute.elixir"] = { fg = p.amber },
		["@comment.documentation.elixir"] = { fg = p.color400 },
		["@operator.elixir"] = { fg = p.frost },
		["@punctuation.special.elixir"] = { fg = p.coral },
	}
end

return M
