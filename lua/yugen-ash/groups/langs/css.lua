-- CSS / SCSS language groups (.css / .scss) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy css.vim syntax groups
		cssTagName = { fg = p.sage },
		cssClassName = { fg = p.gold },
		cssClassNameDot = { fg = p.color400 },
		cssIdentifier = { fg = p.gold },
		cssPseudoClass = { fg = p.seafoam },
		cssPseudoClassId = { fg = p.seafoam },
		cssPseudoClassFn = { fg = p.primary },
		cssAttributeSelector = { fg = p.gold },
		cssProp = { fg = p.tide },
		cssAttr = { fg = p.violet },
		cssAttrComma = { fg = p.color400 },
		cssAttrRegion = { fg = p.violet },
		cssValueLength = { fg = p.violet },
		cssValueNumber = { fg = p.violet },
		cssValueInteger = { fg = p.violet },
		cssValueAngle = { fg = p.violet },
		cssValueTime = { fg = p.violet },
		cssColor = { fg = p.coral },
		cssFunctionName = { fg = p.primary },
		cssFunction = { fg = p.primary },
		cssUnitDecorators = { fg = p.amber },
		cssImportant = { fg = p.crimson, style = "bold" },
		cssBraces = { fg = p.color400 },
		cssNoise = { fg = p.color400 },
		cssString = { fg = p.sage },
		cssStringQ = { fg = p.sage },
		cssStringQQ = { fg = p.sage },
		cssComment = { fg = p.color400 },
		cssMediaType = { fg = p.crimson },
		cssMediaKeyword = { fg = p.crimson },
		cssAtRule = { fg = p.crimson },
		cssAtKeyword = { fg = p.crimson },
		cssVendor = { fg = p.color400 },
		cssURL = { fg = p.seafoam, style = "underline" },
		-- SCSS
		scssVariable = { fg = p.violet },
		scssVariableValue = { fg = p.color200 },
		scssMixin = { fg = p.crimson },
		scssMixinName = { fg = p.primary },
		scssInclude = { fg = p.crimson },
		scssSelectorName = { fg = p.gold },
		scssNestingSelector = { fg = p.gold },
		scssAmpersand = { fg = p.crimson },
		scssInterpolation = { fg = p.coral },
		scssInterpolationDelimiter = { fg = p.coral },

		-- CSS Treesitter
		["@type.css"] = { fg = p.sage },
		["@type.tag.css"] = { fg = p.sage },
		["@property.css"] = { fg = p.tide },
		["@string.css"] = { fg = p.sage },
		["@string.plain.css"] = { fg = p.sage },
		["@number.css"] = { fg = p.violet },
		["@function.css"] = { fg = p.primary },
		["@keyword.css"] = { fg = p.crimson },
		["@constant.css"] = { fg = p.violet },
		["@attribute.css"] = { fg = p.gold },
		["@tag.attribute.css"] = { fg = p.gold },
		["@punctuation.delimiter.css"] = { fg = p.color400 },
		["@punctuation.special.css"] = { fg = p.coral },
		["@property.id.css"] = { fg = p.gold },
		["@property.class.css"] = { fg = p.gold },
	}
end

return M
