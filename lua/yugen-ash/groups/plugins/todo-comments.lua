-- folke/todo-comments.nvim
-- Each keyword exposes Fg (text), Bg (badge), and Sign (gutter) variants.
-- Colors follow the theme's diagnostic semantics.

local M = {}

function M.get(p, groups, styles)
	local keywords = {
		FIX = p.error,
		TODO = p.tide,
		HACK = p.warning,
		WARN = p.warning,
		PERF = p.violet,
		NOTE = p.success,
		TEST = p.crimson,
	}

	local theme = {}
	for key, color in pairs(keywords) do
		theme["TodoFg" .. key] = { fg = color }
		theme["TodoBg" .. key] = { fg = p.color800, bg = color, style = "bold" }
		theme["TodoSign" .. key] = { fg = color }
	end

	return theme
end

return M
