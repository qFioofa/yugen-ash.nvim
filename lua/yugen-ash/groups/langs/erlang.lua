-- Erlang language groups (.erl / .hrl) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy erlang.vim syntax groups
		erlangKeyword = { fg = p.crimson },
		erlangConditional = { fg = p.tide },
		erlangBIF = { fg = p.crimson },
		erlangFunction = { fg = p.primary },
		erlangFunCall = { fg = p.primary },
		erlangLocalFuncRef = { fg = p.primary },
		erlangLocalFuncCall = { fg = p.primary },
		erlangGlobalFuncRef = { fg = p.primary },
		erlangGlobalFuncCall = { fg = p.primary },
		erlangAtom = { fg = p.seafoam },
		erlangVariable = { fg = p.color200 },
		erlangAttribute = { fg = p.amber },
		erlangDirective = { fg = p.violet },
		erlangRecord = { fg = p.gold },
		erlangRecordDef = { fg = p.gold },
		erlangMacro = { fg = p.violet, style = "bold" },
		erlangString = { fg = p.sage },
		erlangStringModifier = { fg = p.gold },
		erlangModifier = { fg = p.gold },
		erlangNumberInteger = { fg = p.violet },
		erlangNumberFloat = { fg = p.violet },
		erlangNumberHex = { fg = p.violet },
		erlangBoolean = { fg = p.tide },
		erlangBitType = { fg = p.gold },
		erlangType = { fg = p.gold },
		erlangOperator = { fg = p.frost },
		erlangPipe = { fg = p.frost },
		erlangRightArrow = { fg = p.frost },
		erlangSeparator = { fg = p.color400 },
		erlangComment = { fg = p.color400 },
		erlangProcess = { fg = p.crimson },
		erlangPort = { fg = p.crimson },

		-- Erlang Treesitter
		["@keyword.erlang"] = { fg = p.crimson },
		["@keyword.directive.erlang"] = { fg = p.violet },
		["@keyword.import.erlang"] = { fg = p.violet },
		["@function.erlang"] = { fg = p.primary },
		["@function.call.erlang"] = { fg = p.primary },
		["@function.builtin.erlang"] = { fg = p.crimson },
		["@module.erlang"] = { fg = p.gold },
		["@type.erlang"] = { fg = p.gold },
		["@constant.erlang"] = { fg = p.violet },
		["@string.special.symbol.erlang"] = { fg = p.seafoam },
		["@variable.erlang"] = { fg = p.color200 },
		["@variable.member.erlang"] = { fg = p.color300 },
		["@attribute.erlang"] = { fg = p.amber },
		["@operator.erlang"] = { fg = p.frost },
		["@punctuation.delimiter.erlang"] = { fg = p.color400 },
		["@comment.erlang"] = { fg = p.color400 },
	}
end

return M
