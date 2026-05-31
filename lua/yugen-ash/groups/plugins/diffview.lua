-- sindrets/diffview.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		DiffviewNormal = { link = "Normal" },
		DiffviewCursorLine = { bg = p.color600 },
		DiffviewWinSeparator = { fg = groups.border },
		DiffviewStatusAdded = { fg = p.sage },
		DiffviewStatusModified = { fg = p.tide },
		DiffviewStatusDeleted = { fg = p.crimson },
		DiffviewStatusRenamed = { fg = p.tide },
		DiffviewStatusUntracked = { fg = p.sage },
		DiffviewFilePanelTitle = { fg = p.primary, style = "bold" },
		DiffviewFilePanelCounter = { fg = p.violet, style = "bold" },
		DiffviewFilePanelFileName = { fg = p.color200 },
		DiffviewFilePanelPath = { fg = p.color400 },
		DiffviewFilePanelRootPath = { fg = p.color400 },
		DiffviewFilePanelInsertions = { fg = p.sage },
		DiffviewFilePanelDeletions = { fg = p.crimson },
		DiffviewFolderName = { fg = p.color300 },
		DiffviewFolderSign = { fg = p.crimson },
	}
end

return M
