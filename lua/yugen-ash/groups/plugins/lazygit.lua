-- kdheepak/lazygit.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		LazyGitFloat = { fg = p.color200, bg = p.color700 },
		LazyGitBorder = { fg = groups.border, bg = p.color700 },
	}
end

return M
