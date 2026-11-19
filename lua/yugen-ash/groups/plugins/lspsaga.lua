-- nvimdev/lspsaga.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		SagaNormal = { fg = p.color200, bg = styles.panel },
		SagaBorder = { fg = groups.border, bg = styles.panel },
		SagaTitle = { fg = p.primary, bg = styles.panel, style = styles.bold },
		SagaText = { fg = p.color200, bg = styles.panel },
		SagaSelect = { fg = p.color200, bg = p.color600, style = styles.bold },
		SagaSearch = { fg = p.color200, bg = p.color600 },
		SagaFinderFname = { fg = p.primary },
		SagaDetail = { fg = p.color400 },
		SagaCount = { fg = p.color800, bg = p.primary, style = styles.bold },
		SagaInCurrent = { fg = p.tide },
		SagaSpinner = { fg = p.primary },
		SagaSpinnerTitle = { fg = p.primary, style = styles.bold },
		SagaVirtLine = { fg = p.color500 },
		SagaLightBulb = { fg = p.warning },
		SagaImpIcon = { fg = p.coral },
		SagaFileIcon = { fg = p.primary },
		SagaFileName = { fg = p.color300 },
		SagaFolder = { fg = p.color300 },
		SagaFolderName = { fg = p.color300 },
		SagaButton = { fg = p.success },
		SagaActionTitle = { fg = p.color800, bg = p.success, style = styles.bold },
		SagaWinbarFileName = { fg = p.color200, bg = styles.panel },
		SagaWinbarFolder = { fg = p.color300, bg = styles.panel },
		SagaWinbarFolderName = { fg = p.color300, bg = styles.panel },
		SagaWinbarSep = { fg = groups.border, bg = styles.panel },
		SagaWinbar = { fg = p.color200, bg = styles.panel },

		CodeActionText = { fg = p.color200 },
		CodeActionNumber = { fg = p.success },
		CodeActionCursorLine = { bg = p.color600 },
		ActionPreviewNormal = { fg = p.color200, bg = styles.panel },
		ActionPreviewBorder = { fg = groups.border, bg = styles.panel },
		ActionPreviewTitle = { fg = p.primary, bg = styles.panel, style = styles.bold },

		HoverNormal = { fg = p.color200, bg = styles.panel },

		RenameNormal = { fg = p.color200, bg = styles.panel },
		RenameBorder = { fg = groups.border, bg = styles.panel },
		RenameMatch = { fg = p.color200, bg = p.color600 },

		DiagnosticNormal = { fg = p.color200, bg = styles.panel },
		DiagnosticBorder = { fg = groups.border, bg = styles.panel },
		DiagnosticText = { fg = p.color200 },
		DiagnosticShowNormal = { fg = p.color200, bg = styles.panel },
		DiagnosticShowBorder = { fg = groups.border, bg = styles.panel },

		TerminalNormal = { fg = p.color200, bg = styles.panel },
		TerminalBorder = { fg = groups.border, bg = styles.panel },
	}
end

return M
