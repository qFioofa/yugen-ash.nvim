-- MeanderingProgrammer/render-markdown.nvim
-- Heading colors match the existing markdown.lua scheme.

local M = {}

function M.get(p, groups, styles)
	return {
		RenderMarkdownH1 = { fg = p.primary, style = "bold" },
		RenderMarkdownH2 = { fg = p.coral, style = "bold" },
		RenderMarkdownH3 = { fg = p.gold, style = "bold" },
		RenderMarkdownH4 = { fg = p.crimson, style = "bold" },
		RenderMarkdownH5 = { fg = p.violet, style = "bold" },
		RenderMarkdownH6 = { fg = p.tide, style = "bold" },
		RenderMarkdownH1Bg = { bg = p.color600 },
		RenderMarkdownH2Bg = { bg = p.color600 },
		RenderMarkdownH3Bg = { bg = p.color600 },
		RenderMarkdownH4Bg = { bg = p.color600 },
		RenderMarkdownH5Bg = { bg = p.color600 },
		RenderMarkdownH6Bg = { bg = p.color600 },
		RenderMarkdownCode = { bg = p.color700 },
		RenderMarkdownCodeInline = { fg = p.sage, bg = p.color600 },
		RenderMarkdownBullet = { fg = p.primary },
		RenderMarkdownDash = { fg = p.color400 },
		RenderMarkdownQuote = { fg = p.color400 },
		RenderMarkdownTableHead = { fg = p.color400 },
		RenderMarkdownTableRow = { fg = p.color400 },
		RenderMarkdownTableFill = { link = "Conceal" },
		RenderMarkdownLink = { fg = p.primary },
		RenderMarkdownChecked = { fg = p.success },
		RenderMarkdownUnchecked = { fg = p.color400 },
		RenderMarkdownTodo = { fg = p.gold },
	}
end

return M
