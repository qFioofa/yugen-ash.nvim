-- Bash / shell language groups (.sh / .bash) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy sh.vim syntax groups
		shStatement = { fg = p.color200 },
		shFunctionKey = { fg = p.crimson },
		shFunctionName = { fg = p.primary },
		shConditional = { fg = p.tide },
		shRepeat = { fg = p.tide },
		shLoop = { fg = p.tide },
		shCase = { fg = p.tide },
		shCaseLabel = { fg = p.seafoam },
		shCaseEsac = { fg = p.tide },
		shShellVariables = { fg = p.violet },
		shVariable = { fg = p.color200 },
		shVarAssign = { fg = p.tide },
		shDerefSimple = { fg = p.violet },
		shDerefVar = { fg = p.violet },
		shDeref = { fg = p.violet },
		shCommandSub = { fg = p.color200 },
		shCmdSubRegion = { fg = p.color200 },
		shString = { fg = p.sage },
		shSingleQuote = { fg = p.sage },
		shDoubleQuote = { fg = p.sage },
		shQuote = { fg = p.sage },
		shTestOpr = { fg = p.frost },
		shOption = { fg = p.amber },
		shOperator = { fg = p.frost },
		shRange = { fg = p.color200 },
		shRedir = { fg = p.tide },
		shSetList = { fg = p.color200 },
		shSpecial = { fg = p.rust },
		shSpecialDQ = { fg = p.rust },
		shEscape = { fg = p.rust },
		shComment = { fg = p.color400 },
		shShebang = { fg = p.color400 },
		shAlias = { fg = p.primary },

		-- Bash Treesitter
		["@keyword.bash"] = { fg = p.crimson },
		["@keyword.conditional.bash"] = { fg = p.tide },
		["@keyword.repeat.bash"] = { fg = p.tide },
		["@function.bash"] = { fg = p.primary },
		["@function.builtin.bash"] = { fg = p.primary },
		["@variable.bash"] = { fg = p.color200 },
		["@variable.parameter.bash"] = { fg = p.violet },
		["@string.special.bash"] = { fg = p.gold },
		["@string.special.path.bash"] = { fg = p.sage },
		["@operator.bash"] = { fg = p.frost },
		["@punctuation.special.bash"] = { fg = p.coral },
		["@constant.bash"] = { fg = p.violet },
		["@parameter.bash"] = { fg = p.amber },
	}
end

return M
