-- C# language groups (.cs) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy cs.vim syntax groups
		csType = { fg = p.gold },
		csNewType = { fg = p.gold },
		csClass = { fg = p.crimson },
		csClassType = { fg = p.gold },
		csStorage = { fg = p.crimson },
		csModifier = { fg = p.crimson },
		csAccessModifier = { fg = p.crimson },
		csKeyword = { fg = p.crimson },
		csLogicSymbols = { fg = p.tide },
		csConditional = { fg = p.tide },
		csRepeat = { fg = p.tide },
		csLabel = { fg = p.seafoam },
		csException = { fg = p.tide },
		csUnspecifiedStatement = { fg = p.crimson },
		csContextualStatement = { fg = p.crimson },
		csInterpolation = { fg = p.coral },
		csInterpolationDelimiter = { fg = p.coral },
		csQuote = { fg = p.sage },
		csString = { fg = p.sage },
		csVerbatimString = { fg = p.sage },
		csEndColon = { fg = p.color400 },
		csComment = { fg = p.color400 },
		csXmlComment = { fg = p.color400 },
		csXmlTag = { fg = p.tide },
		csXmlCommentLeader = { fg = p.color400 },
		csPreProcessor = { fg = p.crimson },
		csPreCondit = { fg = p.crimson },
		csRegion = { fg = p.violet },
		csAttribute = { fg = p.amber, style = styles.italic },
		csUserType = { fg = p.gold },
		csUserMethod = { fg = p.primary },
		csUserIdentifier = { fg = p.color200 },
		csBoolean = { fg = p.tide },
		csNumber = { fg = p.violet },
		csFloat = { fg = p.violet },
		csNull = { fg = p.violet },

		-- C# Treesitter
		["@keyword.c_sharp"] = { fg = p.crimson },
		["@keyword.import.c_sharp"] = { fg = p.violet },
		["@keyword.function.c_sharp"] = { fg = p.crimson },
		["@keyword.return.c_sharp"] = { fg = p.crimson },
		["@type.c_sharp"] = { fg = p.gold },
		["@type.builtin.c_sharp"] = { fg = p.amber },
		["@type.definition.c_sharp"] = { fg = p.gold },
		["@function.c_sharp"] = { fg = p.primary },
		["@function.builtin.c_sharp"] = { fg = p.crimson },
		["@constant.c_sharp"] = { fg = p.violet },
		["@constant.builtin.c_sharp"] = { fg = p.violet },
		["@variable.builtin.c_sharp"] = { fg = p.color300 },
		["@attribute.c_sharp"] = { fg = p.amber, style = styles.italic },
		["@constructor.c_sharp"] = { fg = p.gold },
		["@property.c_sharp"] = { fg = p.color300 },
		["@punctuation.special.c_sharp"] = { fg = p.coral },
	}
end

return M
