-- Diagnostics, inlay hints, and legacy LSP diagnostics (compatibility)

local M = {}

function M.get(p, groups, styles)
	return {
		DiagnosticError = { fg = p.error },
		DiagnosticWarn = { fg = p.warning },
		DiagnosticInfo = { fg = p.tide },
		DiagnosticHint = { fg = p.success },
		DiagnosticUnderlineError = { sp = p.error, style = "undercurl" },
		DiagnosticUnderlineWarn = { sp = p.warning, style = "undercurl" },
		DiagnosticUnderlineInfo = { sp = p.tide, style = "undercurl" },
		DiagnosticUnderlineHint = { sp = p.success, style = "undercurl" },
		DiagnosticVirtualTextError = { fg = p.error },
		DiagnosticVirtualTextWarn = { fg = p.warning },
		DiagnosticVirtualTextInfo = { fg = p.tide },
		DiagnosticVirtualTextHint = { fg = p.success },
		DiagnosticSignError = { fg = p.error },
		DiagnosticSignWarn = { fg = p.warning },
		DiagnosticSignInfo = { fg = p.tide },
		DiagnosticSignHint = { fg = p.success },
		DiagnosticDeprecated = { fg = p.color500, style = "strikethrough" },
		DiagnosticUnnecessary = { fg = p.color500, style = "italic" },
		LspInlayHint = { fg = p.color400, style = "italic" },
		LspInlayHintBackground = { bg = groups.panel },
		LspInlayHintType = { fg = p.color400 },
		LspInlayHintParameter = { fg = p.color300 },

		-- Legacy LSP diagnostics (compatibility)
		LspDiagnosticsDefaultError = { fg = p.error },
		LspDiagnosticsDefaultWarning = { fg = p.warning },
		LspDiagnosticsDefaultInformation = { fg = p.tide },
		LspDiagnosticsDefaultHint = { fg = p.success },
		LspDiagnosticsUnderlineError = { sp = p.error, style = "undercurl" },
		LspDiagnosticsUnderlineWarning = { sp = p.warning, style = "undercurl" },
		LspDiagnosticsUnderlineInformation = { sp = p.tide, style = "undercurl" },
		LspDiagnosticsUnderlineHint = { sp = p.success, style = "undercurl" },
		LspDiagnosticsVirtualTextError = { fg = p.error },
		LspDiagnosticsVirtualTextWarning = { fg = p.warning },
		LspDiagnosticsVirtualTextInformation = { fg = p.tide },
		LspDiagnosticsVirtualTextHint = { fg = p.success },
		LspDiagnosticsSignError = { fg = p.error },
		LspDiagnosticsSignWarning = { fg = p.warning },
		LspDiagnosticsSignInformation = { fg = p.tide },
		LspDiagnosticsSignHint = { fg = p.success },
		LspDiagnosticsFloatingError = { fg = p.error, bg = groups.panel },
		LspDiagnosticsFloatingWarning = { fg = p.warning, bg = groups.panel },
		LspDiagnosticsFloatingInformation = { fg = p.tide, bg = groups.panel },
		LspDiagnosticsFloatingHint = { fg = p.success, bg = groups.panel },
	}
end

return M
