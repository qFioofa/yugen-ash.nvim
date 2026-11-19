-- mbbill/undotree

local M = {}

function M.get(p, groups, styles)
	return {
		UndotreeNode = { fg = p.color200 },
		UndotreeNodeCurrent = { fg = p.crimson, style = styles.bold },
		UndotreeTimeStamp = { fg = p.color400 },
		UndotreeFirstNode = { fg = p.primary },
		UndotreeBranch = { fg = p.color500 },
		UndotreeSeq = { fg = groups.comment },
		UndotreeCurrent = { fg = p.crimson, style = styles.bold },
		UndotreeNext = { fg = p.gold },
		UndotreeHead = { fg = p.color200 },
		UndotreeHelp = { fg = groups.comment },
		UndotreeHelpKey = { fg = p.primary },
		UndotreeHelpTitle = { fg = p.gold, style = styles.bold },
		UndotreeSavedSmall = { fg = groups.warn },
		UndotreeSavedBig = { fg = p.primary, style = styles.bold },
	}
end

return M
