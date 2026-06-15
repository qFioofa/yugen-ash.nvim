-- Kotlin language groups (.kt / .kts) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy kotlin-vim syntax groups
		ktKeyword = { fg = p.crimson },
		ktImport = { fg = p.violet },
		ktPackage = { fg = p.violet },
		ktModifier = { fg = p.crimson },
		ktVisibilityModifier = { fg = p.crimson },
		ktStructure = { fg = p.crimson },
		ktConditional = { fg = p.tide },
		ktRepeat = { fg = p.tide },
		ktExceptions = { fg = p.tide },
		ktType = { fg = p.gold },
		ktTypeDef = { fg = p.gold },
		ktFunction = { fg = p.primary },
		ktFunctionCall = { fg = p.primary },
		ktString = { fg = p.sage },
		ktStringInterpolation = { fg = p.coral },
		ktSimpleInterpolation = { fg = p.coral },
		ktComplexInterpolation = { fg = p.coral },
		ktComplexInterpolationBrace = { fg = p.coral },
		ktEscapedName = { fg = p.color200 },
		ktEscape = { fg = p.rust },
		ktLabel = { fg = p.seafoam },
		ktAnnotation = { fg = p.amber, style = styles.italic },
		ktBoolean = { fg = p.tide },
		ktConstant = { fg = p.violet },
		ktNull = { fg = p.violet },
		ktNumber = { fg = p.violet },
		ktFloat = { fg = p.violet },
		ktComment = { fg = p.color400 },
		ktDocComment = { fg = p.color400 },
		ktShebang = { fg = p.color400 },
		ktOperator = { fg = p.frost },

		-- Kotlin Treesitter
		["@keyword.kotlin"] = { fg = p.crimson },
		["@keyword.import.kotlin"] = { fg = p.violet },
		["@keyword.function.kotlin"] = { fg = p.crimson },
		["@keyword.return.kotlin"] = { fg = p.crimson },
		["@type.kotlin"] = { fg = p.gold },
		["@type.builtin.kotlin"] = { fg = p.amber },
		["@function.kotlin"] = { fg = p.primary },
		["@function.builtin.kotlin"] = { fg = p.crimson },
		["@constant.kotlin"] = { fg = p.violet },
		["@constant.builtin.kotlin"] = { fg = p.violet },
		["@variable.builtin.kotlin"] = { fg = p.color300 },
		["@attribute.kotlin"] = { fg = p.amber, style = styles.italic },
		["@annotation.kotlin"] = { fg = p.amber, style = styles.italic },
		["@constructor.kotlin"] = { fg = p.gold },
		["@label.kotlin"] = { fg = p.seafoam },
		["@punctuation.special.kotlin"] = { fg = p.coral },
	}
end

return M
