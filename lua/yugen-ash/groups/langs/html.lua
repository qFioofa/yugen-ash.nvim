-- HTML language groups (.html) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy html.vim syntax groups
		htmlTag = { fg = p.color400 },
		htmlEndTag = { fg = p.color400 },
		htmlTagName = { fg = p.sage },
		htmlSpecialTagName = { fg = p.crimson },
		htmlTagN = { fg = p.sage },
		htmlArg = { fg = p.gold, style = styles.italic },
		htmlString = { fg = p.sage },
		htmlValue = { fg = p.sage },
		htmlSpecialChar = { fg = p.rust },
		htmlComment = { fg = p.color400 },
		htmlCommentPart = { fg = p.color400 },
		htmlPreProc = { fg = p.crimson },
		htmlPreStmt = { fg = p.crimson },
		htmlH1 = { fg = p.primary, style = "bold" },
		htmlH2 = { fg = p.primary, style = "bold" },
		htmlH3 = { fg = p.primary, style = "bold" },
		htmlBold = { style = "bold" },
		htmlItalic = { style = "italic" },
		htmlUnderline = { style = "underline" },
		htmlLink = { fg = p.seafoam, style = "underline" },
		htmlTitle = { fg = p.color200 },
		htmlScriptTag = { fg = p.crimson },
		htmlEvent = { fg = p.gold, style = styles.italic },

		-- HTML Treesitter
		["@tag.html"] = { fg = p.sage },
		["@tag.builtin.html"] = { fg = p.sage },
		["@tag.attribute.html"] = { fg = p.gold, style = styles.italic },
		["@tag.delimiter.html"] = { fg = p.color400 },
		["@string.html"] = { fg = p.sage },
		["@constant.html"] = { fg = p.violet },
		["@text.title.html"] = { fg = p.primary, style = "bold" },
		["@punctuation.bracket.html"] = { fg = p.color400 },
		["@punctuation.special.html"] = { fg = p.coral },
		["@markup.heading.html"] = { fg = p.primary, style = "bold" },
		["@markup.link.html"] = { fg = p.seafoam, style = "underline" },
	}
end

return M
