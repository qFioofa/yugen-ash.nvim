-- nvim-tree/nvim-tree.lua

local M = {}

function M.get(p, groups, styles)
	return {
		NvimTreeFolderIcon = { fg = p.crimson },
		NvimTreeFolderName = { fg = p.color300 },
		NvimTreeNormal = { fg = p.color200 },
		NvimTreeRootFolder = { fg = p.color100, style = "bold" },
		NvimTreeGitNew = { fg = p.sage },
		NvimTreeGitDirty = { fg = p.color200 },
		NvimTreeGitStaged = { fg = p.seafoam },
	}
end

return M
