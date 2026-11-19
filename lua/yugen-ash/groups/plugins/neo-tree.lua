-- nvim-neo-tree/neo-tree.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		-- Window chrome
		NeoTreeNormal = { fg = p.color200, bg = styles.panel },
		NeoTreeNormalNC = { fg = p.color400, bg = styles.nc_background },
		NeoTreeSignColumn = { bg = styles.panel },
		NeoTreeStatusLine = { fg = p.color200, bg = styles.statusline },
		NeoTreeStatusLineNC = { fg = p.color400, bg = styles.background },
		NeoTreeVertSplit = { fg = groups.border },
		NeoTreeWinSeparator = { fg = groups.border, bg = styles.panel },
		NeoTreeEndOfBuffer = { fg = p.color600 },
		NeoTreeFloatNormal = { fg = p.color200, bg = styles.panel },
		NeoTreeFloatBorder = { fg = groups.border, bg = styles.panel },
		NeoTreeFloatTitle = { fg = p.color200, bg = styles.panel, style = styles.bold },
		NeoTreeTitleBar = { fg = p.color800, bg = groups.border, style = styles.bold },
		NeoTreePreview = { bg = p.color600 },

		-- Entries
		NeoTreeDirectoryIcon = { fg = p.crimson },
		NeoTreeDirectoryName = { fg = p.color300 },
		NeoTreeFileIcon = { fg = p.color300 },
		NeoTreeFileName = { fg = p.color200 },
		NeoTreeFileNameOpened = { fg = p.color200, style = styles.bold },
		NeoTreeRootName = { fg = p.color200, style = styles.bold },
		NeoTreeSymbolicLinkTarget = { fg = p.seafoam },
		NeoTreeBufferNumber = { fg = p.violet },
		NeoTreeCursorLine = { bg = p.color600 },
		NeoTreeSelected = { fg = p.color200, bg = p.color600 },
		NeoTreeFilterTerm = { fg = p.primary, style = styles.bold },
		NeoTreeMessage = { fg = p.color400, style = styles.italic },
		NeoTreeFileStats = { fg = p.color400 },
		NeoTreeFileStatsHeader = { fg = p.color400, style = styles.bold },
		NeoTreeModified = { fg = groups.git_change, style = styles.bold },

		-- Muted entries and indicators
		NeoTreeDotfile = { fg = p.color500 },
		NeoTreeHiddenByName = { fg = p.color500 },
		NeoTreeIgnored = { fg = p.color500 },
		NeoTreeWindowsHidden = { fg = p.color500 },
		NeoTreeDimText = { fg = p.color400 },
		NeoTreeFadeText1 = { fg = p.color400 },
		NeoTreeFadeText2 = { fg = p.color500 },
		NeoTreeIndentMarker = { fg = p.color500 },
		NeoTreeExpander = { fg = p.color400 },

		-- Git state
		NeoTreeGitAdded = { fg = groups.git_add },
		NeoTreeGitDeleted = { fg = groups.git_delete },
		NeoTreeGitModified = { fg = groups.git_change },
		NeoTreeGitConflict = { fg = groups.error, style = styles.bold },
		NeoTreeGitIgnored = { fg = groups.git_ignore },
		NeoTreeGitRenamed = { fg = groups.git_rename },
		NeoTreeGitStaged = { fg = groups.git_stage },
		NeoTreeGitUnstaged = { fg = groups.git_change },
		NeoTreeGitUntracked = { fg = groups.git_dirty },

		-- Tabs
		NeoTreeTabActive = { fg = p.color800, bg = p.primary, style = styles.bold },
		NeoTreeTabInactive = { fg = p.color400, bg = styles.statusline },
		NeoTreeTabSeparatorActive = { fg = p.color800, bg = p.primary },
		NeoTreeTabSeparatorInactive = { fg = p.color500, bg = styles.statusline },
	}
end

return M
