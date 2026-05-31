-- lewis6991/gitsigns.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		GitSignsAdd = { fg = groups.git_add },
		GitSignsChange = { fg = groups.git_change },
		GitSignsDelete = { fg = groups.git_delete },
		GitSignsCurrentLineBlame = { fg = p.color400 },
	}
end

return M
