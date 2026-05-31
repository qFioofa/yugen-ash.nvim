-- Go language groups (.go) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy go.vim syntax groups
		goDirective = { fg = p.violet },
		goPackage = { fg = p.crimson },
		goImport = { fg = p.violet },
		goDeclaration = { fg = p.crimson },
		goDeclType = { fg = p.crimson },
		goStatement = { fg = p.crimson },
		goConditional = { fg = p.tide },
		goLabel = { fg = p.seafoam },
		goRepeat = { fg = p.tide },
		goType = { fg = p.gold },
		goSignedInts = { fg = p.amber },
		goUnsignedInts = { fg = p.amber },
		goFloats = { fg = p.amber },
		goComplexes = { fg = p.amber },
		goBuiltins = { fg = p.crimson },
		goPredefinedIdentifiers = { fg = p.violet },
		goVar = { fg = p.crimson },
		goConst = { fg = p.crimson },
		goStruct = { fg = p.gold },
		goStructDef = { fg = p.gold },
		goInterface = { fg = p.gold },
		goFunction = { fg = p.primary },
		goFunctionCall = { fg = p.primary },
		goFunctionReturn = { fg = p.color200 },
		goReceiverType = { fg = p.gold },
		goString = { fg = p.sage },
		goRawString = { fg = p.sage },
		goEscape = { fg = p.gold },
		goField = { fg = p.color300 },
		goBoolean = { fg = p.tide },
		goConstants = { fg = p.violet },
		goComment = { fg = p.color400 },
		goSpecialString = { fg = p.gold },
		goOperator = { fg = p.tide },

		-- Go Treesitter
		["@keyword.go"] = { fg = p.crimson },
		["@keyword.import.go"] = { fg = p.violet },
		["@keyword.function.go"] = { fg = p.crimson },
		["@keyword.return.go"] = { fg = p.crimson },
		["@type.go"] = { fg = p.gold },
		["@type.builtin.go"] = { fg = p.amber },
		["@function.go"] = { fg = p.primary },
		["@function.builtin.go"] = { fg = p.crimson },
		["@constant.builtin.go"] = { fg = p.violet },
		["@variable.member.go"] = { fg = p.color300 },
		["@module.go"] = { fg = p.gold },
		["@label.go"] = { fg = p.seafoam },
		["@string.special.go"] = { fg = p.gold },
		["@operator.go"] = { fg = p.tide },
		["@punctuation.special.go"] = { fg = p.coral },
	}
end

return M
