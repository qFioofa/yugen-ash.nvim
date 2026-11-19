-- ravitemer/mcphub.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		-- Titles and headers
		MCPHubTitle = { fg = p.primary, style = styles.bold },
		MCPHubHeader = { fg = p.primary, style = styles.bold },
		MCPHubHeaderBtn = { fg = p.color800, bg = p.primary, style = styles.bold },
		MCPHubHeaderBtnShortcut = { fg = p.color800, bg = p.primary, style = styles.bold },
		MCPHubHeaderShortcut = { fg = p.primary, style = styles.bold },
		MCPHubKeymap = { fg = p.amber, style = styles.bold },

		-- States
		MCPHubSuccess = { fg = groups.hint },
		MCPHubSuccessItalic = { fg = groups.hint, style = styles.bold .. "," .. styles.italic },
		MCPHubSuccessFill = { fg = p.color800, bg = groups.hint, style = styles.bold },
		MCPHubInfo = { fg = groups.info },
		MCPHubWarning = { fg = groups.warn },
		MCPHubWarnItalic = { fg = groups.warn, style = styles.bold .. "," .. styles.italic },
		MCPHubWarnFill = { fg = p.color800, bg = groups.warn, style = styles.bold },
		MCPHubError = { fg = groups.error },
		MCPHubErrorFill = { fg = p.color800, bg = groups.error, style = styles.bold },
		MCPHubMuted = { fg = groups.comment },
		MCPHubLink = { fg = groups.info, style = "underline" },

		-- Buttons
		MCPHubButtonActive = { fg = p.color200, bg = p.color600 },
		MCPHubButtonInactive = { fg = p.color400, bg = styles.panel },

		-- Chrome
		MCPHubSeamlessBorder = { fg = styles.panel, bg = styles.panel },

		-- Embedded JSON
		MCPHubJsonProperty = { fg = p.color300 },
		MCPHubJsonString = { fg = p.sage },
		MCPHubJsonNumber = { fg = p.violet },
		MCPHubJsonBoolean = { fg = p.tide },
		MCPHubJsonNull = { fg = p.violet },
		MCPHubJsonPunctuation = { fg = groups.punctuation },

		-- Embedded markdown
		MCPHubText = { fg = p.color200 },
		MCPHubCode = { fg = p.rust },
		MCPHubHeading = { fg = p.primary, style = styles.bold },

		-- Diffs
		MCPHubDiffAdd = { fg = groups.git_add, bg = p.color600, style = styles.bold },
		MCPHubDiffChange = { fg = groups.git_change, bg = p.color600, style = styles.bold },
		MCPHubDiffDelete = { fg = groups.git_delete, bg = p.color600, style = styles.italic },
	}
end

return M
