-- Python language groups (.py) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy python.vim syntax groups
		pythonStatement = { fg = p.crimson },
		pythonKeyword = { fg = p.crimson },
		pythonImport = { fg = p.violet },
		pythonInclude = { fg = p.violet },
		pythonFunction = { fg = p.primary },
		pythonDefName = { fg = p.primary },
		pythonClassName = { fg = p.gold },
		pythonClass = { fg = p.gold },
		pythonConditional = { fg = p.tide },
		pythonRepeat = { fg = p.tide },
		pythonException = { fg = p.tide },
		pythonExceptions = { fg = p.crimson },
		pythonOperator = { fg = p.tide },
		pythonDecorator = { fg = p.amber, style = styles.italic },
		pythonDecoratorName = { fg = p.amber, style = styles.italic },
		pythonBuiltin = { fg = p.crimson },
		pythonBuiltinObj = { fg = p.amber },
		pythonBuiltinFunc = { fg = p.crimson },
		pythonBuiltinType = { fg = p.amber },
		pythonConstant = { fg = p.violet },
		pythonBoolean = { fg = p.tide },
		pythonNone = { fg = p.violet },
		pythonNumber = { fg = p.violet },
		pythonString = { fg = p.sage },
		pythonRawString = { fg = p.sage },
		pythonBytes = { fg = p.sage },
		pythonFString = { fg = p.sage },
		pythonStrFormat = { fg = p.coral },
		pythonStrFormatting = { fg = p.coral },
		pythonStrInterpRegion = { fg = p.coral },
		pythonEscape = { fg = p.gold },
		pythonComment = { fg = p.color400 },
		pythonDocstring = { fg = p.color400 },
		pythonSelf = { fg = p.color300, style = styles.italic },
		pythonAttribute = { fg = p.color300 },
		pythonDot = { fg = p.color400 },

		-- Python Treesitter
		["@keyword.python"] = { fg = p.crimson },
		["@keyword.import.python"] = { fg = p.violet },
		["@keyword.function.python"] = { fg = p.crimson },
		["@keyword.operator.python"] = { fg = p.tide },
		["@function.python"] = { fg = p.primary },
		["@function.builtin.python"] = { fg = p.crimson },
		["@function.call.python"] = { fg = p.primary },
		["@type.python"] = { fg = p.gold },
		["@type.builtin.python"] = { fg = p.amber },
		["@constant.python"] = { fg = p.violet },
		["@constant.builtin.python"] = { fg = p.violet },
		["@variable.builtin.python"] = { fg = p.color300, style = styles.italic },
		["@attribute.python"] = { fg = p.amber, style = styles.italic },
		["@constructor.python"] = { fg = p.gold },
		["@string.documentation.python"] = { fg = p.color400 },
		["@punctuation.special.python"] = { fg = p.coral },
	}
end

return M
