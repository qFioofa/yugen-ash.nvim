-- nvim-telescope/telescope.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		TelescopeNormal = { fg = p.color200, bg = p.color700 },
		TelescopeSelection = { fg = p.color200, bg = p.color600 },
		TelescopeBorder = { fg = p.color500, bg = p.color700 },
		TelescopePromptNormal = { fg = p.color200, bg = p.color700 },
		TelescopePromptBorder = { fg = p.color500, bg = p.color700 },
		TelescopePromptTitle = { fg = p.color200, bg = p.color700 },
		TelescopePreviewTitle = { fg = p.color200, bg = p.color700 },
		TelescopeResultsTitle = { fg = p.color200, bg = p.color700 },
		TelescopeMatching = { fg = p.primary },
		TelescopeSelectionCaret = { fg = p.primary },
		TelescopePromptPrefix = { fg = p.primary },

		-- Tree-sitter-based preview highlights (also used by telescope-ui-select)
		TelescopeResultsComment = { fg = p.color400 },
		TelescopeResultsSpecialComment = { fg = p.color300 },
		TelescopeResultsIdentifier = { fg = p.color200 },
		TelescopeResultsConstant = { fg = p.violet },
		TelescopeResultsFunction = { fg = p.primary },
		TelescopeResultsMethod = { fg = p.primary },
		TelescopeResultsClass = { fg = p.gold },
		TelescopeResultsStruct = { fg = p.gold },
		TelescopeResultsField = { fg = p.color300 },
		TelescopeResultsVariable = { fg = p.color200 },
		TelescopeResultsNumber = { fg = p.violet },
		TelescopeResultsDiffAdd = { fg = p.sage },
		TelescopeResultsDiffChange = { fg = p.warning },
		TelescopeResultsDiffDelete = { fg = p.crimson },
	}
end

return M
