-- Saghen/blink.cmp — mirrors the Pmenu / nvim-cmp colors; kinds follow syntax.

local M = {}

function M.get(p, groups, styles)
	return {
		BlinkCmpMenu = { fg = p.color200, bg = p.color700 },
		BlinkCmpMenuBorder = { fg = groups.border, bg = p.color700 },
		BlinkCmpMenuSelection = { fg = p.color200, bg = p.color600 },
		BlinkCmpScrollBarThumb = { bg = p.color600 },
		BlinkCmpScrollBarGutter = { bg = p.color700 },
		BlinkCmpLabel = { fg = p.color200 },
		BlinkCmpLabelDeprecated = { fg = p.color400, style = "strikethrough" },
		BlinkCmpLabelMatch = { fg = p.primary, style = "bold" },
		BlinkCmpLabelDescription = { fg = p.color400 },
		BlinkCmpLabelDetail = { fg = p.color400 },
		BlinkCmpKind = { fg = p.primary },
		BlinkCmpDoc = { fg = p.color200, bg = p.color700 },
		BlinkCmpDocBorder = { fg = groups.border, bg = p.color700 },
		BlinkCmpDocSeparator = { fg = groups.border },
		BlinkCmpSignatureHelp = { fg = p.color200, bg = p.color700 },
		BlinkCmpSignatureHelpBorder = { fg = groups.border, bg = p.color700 },
		BlinkCmpSignatureHelpActiveParameter = { bg = p.placeholder, style = "bold" },

		-- Per-kind icons (match the syntax color scheme)
		BlinkCmpKindText = { fg = p.color200 },
		BlinkCmpKindMethod = { fg = p.gold },
		BlinkCmpKindFunction = { fg = p.primary },
		BlinkCmpKindConstructor = { fg = p.gold },
		BlinkCmpKindField = { fg = p.color500 },
		BlinkCmpKindVariable = { fg = p.color200 },
		BlinkCmpKindClass = { fg = p.gold },
		BlinkCmpKindInterface = { fg = p.gold },
		BlinkCmpKindModule = { fg = p.violet },
		BlinkCmpKindProperty = { fg = p.color300 },
		BlinkCmpKindUnit = { fg = p.violet },
		BlinkCmpKindValue = { fg = p.violet },
		BlinkCmpKindEnum = { fg = p.gold },
		BlinkCmpKindKeyword = { fg = p.crimson },
		BlinkCmpKindSnippet = { fg = p.seafoam },
		BlinkCmpKindColor = { fg = p.primary },
		BlinkCmpKindFile = { fg = p.color300 },
		BlinkCmpKindReference = { fg = p.tide },
		BlinkCmpKindFolder = { fg = p.crimson },
		BlinkCmpKindEnumMember = { fg = p.violet },
		BlinkCmpKindConstant = { fg = p.violet, style = "bold" },
		BlinkCmpKindStruct = { fg = p.crimson },
		BlinkCmpKindEvent = { fg = p.gold },
		BlinkCmpKindOperator = { fg = p.frost },
		BlinkCmpKindTypeParameter = { fg = p.gold },
		BlinkCmpKindCopilot = { fg = p.success },
	}
end

return M
