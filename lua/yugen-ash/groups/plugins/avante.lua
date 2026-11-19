-- yetone/avante.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		-- Titles and headers
		AvanteTitle = { fg = p.color800, bg = p.primary, style = styles.bold },
		AvanteReversedTitle = { fg = p.primary, bg = styles.panel, style = styles.bold },
		AvanteSubtitle = { fg = p.color800, bg = p.tide, style = styles.bold },
		AvanteReversedSubtitle = { fg = p.tide, bg = styles.panel, style = styles.bold },
		AvanteThirdTitle = { fg = p.color300, bg = p.color600, style = styles.bold },
		AvanteReversedThirdTitle = { fg = p.color300, bg = styles.panel, style = styles.bold },
		AvanteConfirmTitle = { fg = p.color800, bg = groups.error, style = styles.bold },

		-- Annotations and hints
		AvanteSuggestion = { fg = groups.comment, style = styles.italic },
		AvanteAnnotation = { fg = groups.comment, style = styles.italic },
		AvantePopupHint = { fg = p.color400 },
		AvanteInlineHint = { fg = p.color400, style = styles.italic },
		AvanteCommentFg = { fg = groups.comment },

		-- Pending edits
		AvanteToBeDeleted = { fg = p.crimson, bg = p.color600, style = "strikethrough" },
		AvanteToBeDeletedWOStrikethrough = { fg = p.crimson, bg = p.color600 },

		-- Buttons
		AvanteButtonDefault = { fg = p.color800, bg = p.color300, style = styles.bold },
		AvanteButtonDefaultHover = { fg = p.color800, bg = p.color200, style = styles.bold },
		AvanteButtonPrimary = { fg = p.color800, bg = p.tide, style = styles.bold },
		AvanteButtonPrimaryHover = { fg = p.color800, bg = p.seafoam, style = styles.bold },
		AvanteButtonDanger = { fg = p.color800, bg = p.crimson, style = styles.bold },
		AvanteButtonDangerHover = { fg = p.color800, bg = groups.error, style = styles.bold },

		-- Input and layout
		AvantePromptInput = { fg = p.color200, bg = styles.panel },
		AvantePromptInputBorder = { fg = groups.border, bg = styles.panel },
		AvanteSidebarNormal = { fg = p.color200, bg = styles.panel },
		AvanteSidebarWinSeparator = { fg = groups.border, bg = styles.panel },
		AvanteSidebarWinHorizontalSeparator = { fg = groups.border, bg = styles.panel },
		AvanteReversedNormal = { fg = styles.background, bg = p.color200 },

		-- Status spinners
		AvanteStateSpinnerGenerating = { fg = p.color800, bg = p.violet, style = styles.bold },
		AvanteStateSpinnerToolCalling = { fg = p.color800, bg = p.tide, style = styles.bold },
		AvanteStateSpinnerFailed = { fg = p.color800, bg = groups.error, style = styles.bold },
		AvanteStateSpinnerSucceeded = { fg = p.color800, bg = p.success, style = styles.bold },
		AvanteStateSpinnerSearching = { fg = p.color800, bg = p.violet, style = styles.bold },
		AvanteStateSpinnerThinking = { fg = p.color800, bg = p.violet, style = styles.bold },
		AvanteStateSpinnerCompacting = { fg = p.color800, bg = p.violet, style = styles.bold },
		AvanteTaskRunning = { fg = p.violet, style = styles.bold },
		AvanteTaskCompleted = { fg = p.success, style = styles.bold },
		AvanteTaskFailed = { fg = groups.error, style = styles.bold },
		AvanteThinking = { fg = p.violet, style = styles.italic },

		-- Logo gradient
		AvanteLogoLine1 = { fg = p.color100 },
		AvanteLogoLine2 = { fg = p.color100 },
		AvanteLogoLine3 = { fg = p.color200 },
		AvanteLogoLine4 = { fg = p.color200 },
		AvanteLogoLine5 = { fg = p.color200 },
		AvanteLogoLine6 = { fg = p.color300 },
		AvanteLogoLine7 = { fg = p.color300 },
		AvanteLogoLine8 = { fg = p.color300 },
		AvanteLogoLine9 = { fg = p.color400 },
		AvanteLogoLine10 = { fg = p.color400 },
		AvanteLogoLine11 = { fg = p.color400 },
		AvanteLogoLine12 = { fg = p.color500 },
		AvanteLogoLine13 = { fg = p.color500 },
		AvanteLogoLine14 = { fg = p.color500 },

		-- Conflict layout (backgrounds only, like upstream)
		AvanteConflictCurrent = { bg = p.color600, style = styles.bold },
		AvanteConflictCurrentLabel = { bg = p.color600, style = styles.bold },
		AvanteConflictIncoming = { bg = p.color500, style = styles.bold },
		AvanteConflictIncomingLabel = { bg = p.color500, style = styles.bold },
	}
end

return M
