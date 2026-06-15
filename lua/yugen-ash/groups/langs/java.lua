-- Java language groups (.java) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy java.vim syntax groups
		javaExternal = { fg = p.violet },
		javaImport = { fg = p.violet },
		javaClassDecl = { fg = p.crimson },
		javaMethodDecl = { fg = p.crimson },
		javaScopeDecl = { fg = p.crimson },
		javaStorageClass = { fg = p.crimson },
		javaConditional = { fg = p.tide },
		javaRepeat = { fg = p.tide },
		javaBranch = { fg = p.tide },
		javaExceptions = { fg = p.tide },
		javaStatement = { fg = p.crimson },
		javaType = { fg = p.gold },
		javaTypedef = { fg = p.gold },
		javaClassPrimitive = { fg = p.amber },
		javaConstant = { fg = p.violet },
		javaBoolean = { fg = p.tide },
		javaNumber = { fg = p.violet },
		javaString = { fg = p.sage },
		javaCharacter = { fg = p.sage },
		javaSpecialChar = { fg = p.rust },
		javaOperator = { fg = p.frost },
		javaAnnotation = { fg = p.amber, style = styles.italic },
		javaDocTags = { fg = p.tide },
		javaComment = { fg = p.color400 },
		javaCommentTitle = { fg = p.color400 },
		javaDocComment = { fg = p.color400 },
		javaLineComment = { fg = p.color400 },
		javaParen = { fg = p.color400 },
		javaParen1 = { fg = p.color400 },
		javaBraces = { fg = p.color400 },

		-- Java Treesitter
		["@keyword.java"] = { fg = p.crimson },
		["@keyword.import.java"] = { fg = p.violet },
		["@keyword.function.java"] = { fg = p.crimson },
		["@type.java"] = { fg = p.gold },
		["@type.builtin.java"] = { fg = p.amber },
		["@function.java"] = { fg = p.primary },
		["@function.builtin.java"] = { fg = p.primary },
		["@constant.java"] = { fg = p.violet },
		["@constant.builtin.java"] = { fg = p.violet },
		["@variable.builtin.java"] = { fg = p.color300 },
		["@attribute.java"] = { fg = p.amber, style = styles.italic },
		["@annotation.java"] = { fg = p.amber, style = styles.italic },
		["@constructor.java"] = { fg = p.primary },
		["@property.java"] = { fg = p.color300 },
	}
end

return M
