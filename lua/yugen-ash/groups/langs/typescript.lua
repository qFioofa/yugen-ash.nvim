-- TypeScript language groups (.ts / .tsx) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy typescript-vim / yats syntax groups
		typescriptReserved = { fg = p.crimson },
		typescriptLabel = { fg = p.seafoam },
		typescriptBraces = { fg = p.color400 },
		typescriptParens = { fg = p.color400 },
		typescriptEndColons = { fg = p.color400 },
		typescriptFuncKeyword = { fg = p.crimson },
		typescriptFuncName = { fg = p.primary },
		typescriptIdentifier = { fg = p.color300 },
		typescriptType = { fg = p.gold },
		typescriptTypeReference = { fg = p.gold },
		typescriptInterfaceName = { fg = p.gold },
		typescriptClassName = { fg = p.gold },
		typescriptClassKeyword = { fg = p.crimson },
		typescriptClassHeritage = { fg = p.gold },
		typescriptExceptions = { fg = p.tide },
		typescriptConditional = { fg = p.tide },
		typescriptRepeat = { fg = p.tide },
		typescriptStatementKeyword = { fg = p.crimson },
		typescriptOperator = { fg = p.frost },
		typescriptBinaryOp = { fg = p.tide },
		typescriptDecorator = { fg = p.amber, style = styles.italic },
		typescriptImport = { fg = p.crimson },
		typescriptExport = { fg = p.crimson },
		typescriptModule = { fg = p.violet },
		typescriptCall = { fg = p.color200 },
		typescriptArrowFunc = { fg = p.crimson },
		typescriptArrowFuncArg = { fg = p.color200 },
		typescriptBoolean = { fg = p.tide },
		typescriptNull = { fg = p.violet },
		typescriptNumber = { fg = p.violet },
		typescriptGlobal = { fg = p.amber },
		typescriptBuiltin = { fg = p.amber },
		typescriptObjectLabel = { fg = p.color300 },
		typescriptVariable = { fg = p.crimson },
		typescriptTemplateSB = { fg = p.coral },

		-- TypeScript Treesitter
		["@keyword.typescript"] = { fg = p.crimson },
		["@keyword.import.typescript"] = { fg = p.crimson },
		["@keyword.export.typescript"] = { fg = p.crimson },
		["@keyword.function.typescript"] = { fg = p.crimson },
		["@function.typescript"] = { fg = p.primary },
		["@function.builtin.typescript"] = { fg = p.primary },
		["@constructor.typescript"] = { fg = p.primary },
		["@type.typescript"] = { fg = p.gold },
		["@type.builtin.typescript"] = { fg = p.amber },
		["@type.definition.typescript"] = { fg = p.gold },
		["@constant.builtin.typescript"] = { fg = p.tide },
		["@variable.builtin.typescript"] = { fg = p.color300 },
		["@property.typescript"] = { fg = p.color300 },
		["@attribute.typescript"] = { fg = p.amber, style = styles.italic },
		["@label.typescript"] = { fg = p.seafoam },
		["@punctuation.special.typescript"] = { fg = p.coral },
	}
end

return M
