-- Markdown highlight groups (vimscript syntax + Treesitter markup)

local M = {}

function M.get(p, groups, styles)
	return {
		markdownHeadingDelimiter = { fg = p.primary, style = "bold" },
		markdownHeadingRule = { fg = p.color400 },
		markdownHeadingTitle = { fg = p.primary, style = "bold" },
		markdownH1 = { fg = p.primary, style = "bold" },
		markdownH2 = { fg = p.coral, style = "bold" },
		markdownH3 = { fg = p.gold, style = "bold" },
		markdownH4 = { fg = p.crimson, style = "bold" },
		markdownH5 = { fg = p.violet, style = "bold" },
		markdownH6 = { fg = p.tide, style = "bold" },
		markdownBold = { style = "bold" },
		markdownItalic = { style = "italic" },
		markdownBoldItalic = { style = "bold,italic" },
		markdownCode = { fg = p.sage },
		markdownCodeBlock = { fg = p.sage },
		markdownCodeDelimiter = { fg = p.color400 },
		markdownUrl = { fg = p.tide, style = "underline" },
		markdownLinkText = { fg = p.primary },
		markdownLinkDelimiter = { fg = p.color400 },
		markdownUrlTitle = { fg = p.sage },
		markdownUrlTitleDelimiter = { fg = p.color400 },
		markdownListMarker = { fg = p.primary },
		markdownOrderedListMarker = { fg = p.primary },
		markdownRule = { fg = p.color400 },
		markdownBlockquote = { fg = p.color400 },
		markdownH1Delimiter = { fg = p.color400 },
		markdownH2Delimiter = { fg = p.color400 },
		markdownH3Delimiter = { fg = p.color400 },
		markdownH4Delimiter = { fg = p.color400 },
		markdownH5Delimiter = { fg = p.color400 },
		markdownH6Delimiter = { fg = p.color400 },

		-- Treesitter markdown
		["@markup.heading"] = { fg = p.primary, style = "bold" },
		["@markup.heading.1.markdown"] = { fg = p.primary, style = "bold" },
		["@markup.heading.2.markdown"] = { fg = p.coral, style = "bold" },
		["@markup.heading.3.markdown"] = { fg = p.gold, style = "bold" },
		["@markup.heading.4.markdown"] = { fg = p.crimson, style = "bold" },
		["@markup.heading.5.markdown"] = { fg = p.violet, style = "bold" },
		["@markup.heading.6.markdown"] = { fg = p.tide, style = "bold" },
		["@markup.bold"] = { style = "bold" },
		["@markup.italic"] = { style = "italic" },
		["@markup.strikethrough"] = { style = "strikethrough" },
		["@markup.underline"] = { style = "underline" },
		["@markup.link"] = { fg = p.primary },
		["@markup.link.label"] = { fg = p.primary },
		["@markup.link.url"] = { fg = p.tide, style = "underline" },
		["@markup.raw"] = { fg = p.sage },
		["@markup.raw.block"] = { fg = p.sage },
		["@markup.list"] = { fg = p.primary },
		["@markup.list.unchecked"] = { fg = p.color400 },
		["@markup.list.checked"] = { fg = p.success },
		["@punctuation.special.markdown"] = { fg = p.color400 },
	}
end

return M
