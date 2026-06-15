-- LaTeX language groups (.tex) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy tex.vim syntax groups
		texStatement = { fg = p.crimson },
		texCmdName = { fg = p.crimson },
		texBeginEnd = { fg = p.violet },
		texBeginEndName = { fg = p.gold },
		texDocType = { fg = p.violet },
		texDocTypeArgs = { fg = p.gold },
		texInputFile = { fg = p.sage },
		texSection = { fg = p.primary, style = "bold" },
		texSectionMarker = { fg = p.primary },
		texSectionName = { fg = p.primary, style = "bold" },
		texType = { fg = p.gold },
		texTypeStyle = { fg = p.gold },
		texMathZone = { fg = p.tide },
		texMath = { fg = p.tide },
		texMathSymbol = { fg = p.coral },
		texMathOper = { fg = p.tide },
		texMathMatcher = { fg = p.tide },
		texMathDelim = { fg = p.color400 },
		texMathDelimZone = { fg = p.color400 },
		texGreek = { fg = p.coral },
		texSuperscript = { fg = p.amber },
		texSubscript = { fg = p.amber },
		texRefZone = { fg = p.seafoam },
		texRefLabel = { fg = p.seafoam },
		texLabel = { fg = p.seafoam },
		texCite = { fg = p.seafoam },
		texString = { fg = p.sage },
		texDelimiter = { fg = p.color400 },
		texSpecialChar = { fg = p.rust },
		texOption = { fg = p.amber },
		texCmdArgs = { fg = p.color200 },
		texDefName = { fg = p.primary },
		texNewCmd = { fg = p.crimson },
		texComment = { fg = p.color400 },
		texTodo = { fg = p.gold, style = "bold" },

		-- LaTeX Treesitter
		["@keyword.latex"] = { fg = p.crimson },
		["@function.latex"] = { fg = p.primary },
		["@function.macro.latex"] = { fg = p.crimson },
		["@module.latex"] = { fg = p.gold },
		["@markup.heading.latex"] = { fg = p.primary, style = "bold" },
		["@markup.environment.latex"] = { fg = p.violet },
		["@markup.environment.name.latex"] = { fg = p.gold },
		["@markup.link.latex"] = { fg = p.seafoam },
		["@markup.link.label.latex"] = { fg = p.seafoam },
		["@markup.math.latex"] = { fg = p.tide },
		["@markup.list.latex"] = { fg = p.primary },
		["@string.latex"] = { fg = p.sage },
		["@punctuation.delimiter.latex"] = { fg = p.color400 },
		["@punctuation.special.latex"] = { fg = p.coral },
		["@comment.latex"] = { fg = p.color400 },
	}
end

return M
