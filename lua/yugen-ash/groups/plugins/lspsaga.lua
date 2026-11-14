-- nvimdev/lspsaga.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		SagaNormal = { fg = p.color200, bg = p.color700 },
		SagaBorder = { fg = groups.border, bg = p.color700 },
		SagaTitle = { fg = p.primary, bg = p.color700, style = "bold" },
		SagaText = { fg = p.color200, bg = p.color700 },
		SagaSelect = { fg = p.color200, bg = p.color600, style = "bold" },
		SagaSearch = { fg = p.color200, bg = p.color600 },
		SagaFinderFname = { fg = p.primary },
		SagaDetail = { fg = p.color400 },
		SagaCount = { fg = p.color800, bg = p.primary, style = "bold" },
		SagaInCurrent = { fg = p.tide },
		SagaSpinner = { fg = p.primary },
		SagaSpinnerTitle = { fg = p.primary, style = "bold" },
		SagaVirtLine = { fg = p.color500 },
		SagaLightBulb = { fg = p.warning },
		SagaImpIcon = { fg = p.coral },
		SagaFileIcon = { fg = p.primary },
		SagaFileName = { fg = p.color300 },
		SagaFolder = { fg = p.color300 },
		SagaFolderName = { fg = p.color300 },
		SagaButton = { fg = p.success },
		SagaActionTitle = { fg = p.color800, bg = p.success, style = "bold" },
		SagaWinbarFileName = { fg = p.color200, bg = p.color700 },
		SagaWinbarFolder = { fg = p.color300, bg = p.color700 },
		SagaWinbarFolderName = { fg = p.color300, bg = p.color700 },
		SagaWinbarSep = { fg = p.color500, bg = p.color700 },
		SagaWinbar = { fg = p.color200, bg = p.color700 },

		CodeActionText = { fg = p.color200 },
		CodeActionNumber = { fg = p.success },
		CodeActionCursorLine = { bg = p.color600 },
		ActionPreviewNormal = { fg = p.color200, bg = p.color700 },
		ActionPreviewBorder = { fg = groups.border, bg = p.color700 },
		ActionPreviewTitle = { fg = p.primary, bg = p.color700, style = "bold" },

		HoverNormal = { fg = p.color200, bg = p.color700 },
		HoverBorder = { fg = groups.border, bg = p.color700 },

		RenameNormal = { fg = p.color200, bg = p.color700 },
		RenameBorder = { fg = groups.border, bg = p.color700 },
		RenameMatch = { fg = p.color200, bg = p.color600 },

		DiagnosticNormal = { fg = p.color200, bg = p.color700 },
		DiagnosticBorder = { fg = groups.border, bg = p.color700 },
		DiagnosticText = { fg = p.color200 },
		DiagnosticShowNormal = { fg = p.color200, bg = p.color700 },
		DiagnosticShowBorder = { fg = groups.border, bg = p.color700 },

		TerminalNormal = { fg = p.color200, bg = p.color700 },
		TerminalBorder = { fg = groups.border, bg = p.color700 },
	}
end

return M
