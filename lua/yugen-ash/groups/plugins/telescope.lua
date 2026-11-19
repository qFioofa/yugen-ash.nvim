-- nvim-telescope/telescope.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		TelescopeNormal = { fg = p.color200, bg = styles.panel },
		TelescopeSelection = { fg = p.color200, bg = p.color600 },
		TelescopeBorder = { fg = groups.border, bg = styles.panel },
		TelescopePromptNormal = { fg = p.color200, bg = styles.panel },
		TelescopePromptBorder = { fg = groups.border, bg = styles.panel },
		TelescopePromptTitle = { fg = p.color200, bg = styles.panel },
		TelescopePreviewTitle = { fg = p.color200, bg = styles.panel },
		TelescopeResultsTitle = { fg = p.color200, bg = styles.panel },
		TelescopeMatching = { fg = p.primary },
		TelescopeSelectionCaret = { fg = p.primary },
		TelescopePromptPrefix = { fg = p.primary },

		-- Tree-sitter-based preview highlights (also used by telescope-ui-select)
		TelescopeResultsComment = { fg = p.color400 },
		TelescopeResultsSpecialComment = { fg = p.color300 },
		TelescopeResultsIdentifier = { fg = p.color200 },
		TelescopeResultsConstant = { fg = p.tide },
		TelescopeResultsFunction = { fg = p.primary },
		TelescopeResultsMethod = { fg = p.primary },
		TelescopeResultsClass = { fg = p.gold },
		TelescopeResultsStruct = { fg = p.gold },
		TelescopeResultsField = { fg = p.color300 },
		TelescopeResultsVariable = { fg = p.color200 },
		TelescopeResultsNumber = { fg = p.violet },
		TelescopeResultsDiffAdd = { fg = groups.git_add },
		TelescopeResultsDiffChange = { fg = groups.git_change },
		TelescopeResultsDiffDelete = { fg = groups.git_delete },
	}
end

return M
