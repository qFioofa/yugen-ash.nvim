-- Diagnostics, inlay hints, and legacy LSP diagnostics (compatibility)

local M = {}

function M.get(p, groups, styles)
	return {
		DiagnosticError = { fg = groups.error },
		DiagnosticWarn = { fg = groups.warn },
		DiagnosticInfo = { fg = groups.info },
		DiagnosticHint = { fg = groups.hint },
		DiagnosticUnderlineError = { sp = groups.error, style = "undercurl" },
		DiagnosticUnderlineWarn = { sp = groups.warn, style = "undercurl" },
		DiagnosticUnderlineInfo = { sp = groups.info, style = "undercurl" },
		DiagnosticUnderlineHint = { sp = groups.hint, style = "undercurl" },
		DiagnosticVirtualTextError = { fg = groups.error },
		DiagnosticVirtualTextWarn = { fg = groups.warn },
		DiagnosticVirtualTextInfo = { fg = groups.info },
		DiagnosticVirtualTextHint = { fg = groups.hint },
		DiagnosticSignError = { fg = groups.error },
		DiagnosticSignWarn = { fg = groups.warn },
		DiagnosticSignInfo = { fg = groups.info },
		DiagnosticSignHint = { fg = groups.hint },
		DiagnosticDeprecated = { fg = p.color500, style = "strikethrough" },
		DiagnosticUnnecessary = { fg = p.color500, style = styles.italic },
		LspInlayHint = { fg = p.color400, style = styles.italic },
		LspInlayHintBackground = { bg = groups.panel },
		LspInlayHintType = { fg = p.color400 },
		LspInlayHintParameter = { fg = p.color300 },

		-- Legacy LSP diagnostics (compatibility)
		LspDiagnosticsDefaultError = { fg = groups.error },
		LspDiagnosticsDefaultWarning = { fg = groups.warn },
		LspDiagnosticsDefaultInformation = { fg = groups.info },
		LspDiagnosticsDefaultHint = { fg = groups.hint },
		LspDiagnosticsUnderlineError = { sp = groups.error, style = "undercurl" },
		LspDiagnosticsUnderlineWarning = { sp = groups.warn, style = "undercurl" },
		LspDiagnosticsUnderlineInformation = { sp = groups.info, style = "undercurl" },
		LspDiagnosticsUnderlineHint = { sp = groups.hint, style = "undercurl" },
		LspDiagnosticsVirtualTextError = { fg = groups.error },
		LspDiagnosticsVirtualTextWarning = { fg = groups.warn },
		LspDiagnosticsVirtualTextInformation = { fg = groups.info },
		LspDiagnosticsVirtualTextHint = { fg = groups.hint },
		LspDiagnosticsSignError = { fg = groups.error },
		LspDiagnosticsSignWarning = { fg = groups.warn },
		LspDiagnosticsSignInformation = { fg = groups.info },
		LspDiagnosticsSignHint = { fg = groups.hint },
		LspDiagnosticsFloatingError = { fg = groups.error, bg = groups.panel },
		LspDiagnosticsFloatingWarning = { fg = groups.warn, bg = groups.panel },
		LspDiagnosticsFloatingInformation = { fg = groups.info, bg = groups.panel },
		LspDiagnosticsFloatingHint = { fg = groups.hint, bg = groups.panel },
	}
end

return M
