-- PowerShell language groups (.ps1 / .psm1) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy ps1.vim syntax groups
		ps1Keyword = { fg = p.crimson },
		ps1Conditional = { fg = p.tide },
		ps1Repeat = { fg = p.tide },
		ps1Exception = { fg = p.tide },
		ps1Operator = { fg = p.tide },
		ps1Constant = { fg = p.violet },
		ps1Boolean = { fg = p.tide },
		ps1Type = { fg = p.gold },
		ps1Variable = { fg = p.color200 },
		ps1VariableConst = { fg = p.violet },
		ps1Builtin = { fg = p.crimson },
		ps1Cmdlet = { fg = p.primary },
		ps1FunctionDeclaration = { fg = p.primary },
		ps1FunctionInvocation = { fg = p.primary },
		ps1Modifier = { fg = p.crimson },
		ps1Member = { fg = p.color300 },
		ps1Attribute = { fg = p.amber, style = styles.italic },
		ps1String = { fg = p.sage },
		ps1StringLiteral = { fg = p.sage },
		ps1Escape = { fg = p.gold },
		ps1InterpolationDelimiter = { fg = p.coral },
		ps1Hashtable = { fg = p.color200 },
		ps1Number = { fg = p.violet },
		ps1Comment = { fg = p.color400 },
		ps1CommentDoc = { fg = p.color400 },
		ps1CommentString = { fg = p.sage },
		ps1CommentDocTag = { fg = p.tide },

		-- PowerShell Treesitter
		["@keyword.powershell"] = { fg = p.crimson },
		["@keyword.function.powershell"] = { fg = p.crimson },
		["@keyword.return.powershell"] = { fg = p.crimson },
		["@function.powershell"] = { fg = p.primary },
		["@function.call.powershell"] = { fg = p.primary },
		["@function.builtin.powershell"] = { fg = p.crimson },
		["@type.powershell"] = { fg = p.gold },
		["@variable.powershell"] = { fg = p.color200 },
		["@variable.builtin.powershell"] = { fg = p.violet },
		["@constant.powershell"] = { fg = p.violet },
		["@constant.builtin.powershell"] = { fg = p.violet },
		["@string.powershell"] = { fg = p.sage },
		["@operator.powershell"] = { fg = p.tide },
		["@attribute.powershell"] = { fg = p.amber, style = styles.italic },
		["@punctuation.special.powershell"] = { fg = p.coral },
		["@comment.powershell"] = { fg = p.color400 },
	}
end

return M
