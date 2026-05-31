-- Terminal ANSI colors (sets vim.g globals; returns no highlight groups)

local M = {}

function M.get(p, groups, styles)
	vim.g.terminal_color_0 = p.color800
	vim.g.terminal_color_1 = p.primary
	vim.g.terminal_color_2 = p.success
	vim.g.terminal_color_3 = p.warning
	vim.g.terminal_color_4 = p.violet
	vim.g.terminal_color_5 = p.crimson
	vim.g.terminal_color_6 = p.tide
	vim.g.terminal_color_7 = p.color100
	vim.g.terminal_color_8 = p.color300
	vim.g.terminal_color_9 = p.error
	vim.g.terminal_color_10 = p.success
	vim.g.terminal_color_11 = p.warning
	vim.g.terminal_color_12 = p.primary
	vim.g.terminal_color_13 = p.coral
	vim.g.terminal_color_14 = p.tide
	vim.g.terminal_color_15 = p.color100

	return {}
end

return M
