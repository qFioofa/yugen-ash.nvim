-- hrsh7th/nvim-cmp — per-kind icons mirror blink.cmp / the syntax colors.

local M = {}

function M.get(p, groups, styles)
	return {
		CmpItemAbbr = { fg = p.color200 },
		CmpItemAbbrDeprecated = { fg = p.color400, style = "strikethrough" },
		CmpItemAbbrMatch = { fg = p.primary, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = p.primary, style = "bold" },
		CmpItemMenu = { fg = p.color400 },
		CmpItemKind = { fg = p.primary },

		-- Per-kind icons (match the syntax color scheme, same as blink.cmp)
		CmpItemKindText = { fg = p.color200 },
		CmpItemKindMethod = { fg = p.gold },
		CmpItemKindFunction = { fg = p.primary },
		CmpItemKindConstructor = { fg = p.gold },
		CmpItemKindField = { fg = p.color500 },
		CmpItemKindVariable = { fg = p.color200 },
		CmpItemKindClass = { fg = p.gold },
		CmpItemKindInterface = { fg = p.gold },
		CmpItemKindModule = { fg = p.violet },
		CmpItemKindProperty = { fg = p.color300 },
		CmpItemKindUnit = { fg = p.violet },
		CmpItemKindValue = { fg = p.violet },
		CmpItemKindEnum = { fg = p.gold },
		CmpItemKindKeyword = { fg = p.crimson },
		CmpItemKindSnippet = { fg = p.seafoam },
		CmpItemKindColor = { fg = p.primary },
		CmpItemKindFile = { fg = p.color300 },
		CmpItemKindReference = { fg = p.tide },
		CmpItemKindFolder = { fg = p.crimson },
		CmpItemKindEnumMember = { fg = p.violet },
		CmpItemKindConstant = { fg = p.violet, style = "bold" },
		CmpItemKindStruct = { fg = p.crimson },
		CmpItemKindEvent = { fg = p.gold },
		CmpItemKindOperator = { fg = p.frost },
		CmpItemKindTypeParameter = { fg = p.gold },
		CmpItemKindCopilot = { fg = p.success },
	}
end

return M
