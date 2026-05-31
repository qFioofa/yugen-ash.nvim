-- rcarriga/nvim-notify
-- Per level: Border, Icon, Title (the level color) and Body (normal text).

local M = {}

function M.get(p, groups, styles)
	local levels = {
		ERROR = p.error,
		WARN = p.warning,
		INFO = p.tide,
		DEBUG = p.color400,
		TRACE = p.violet,
	}

	local theme = {}
	for level, color in pairs(levels) do
		theme["Notify" .. level .. "Border"] = { fg = color }
		theme["Notify" .. level .. "Icon"] = { fg = color }
		theme["Notify" .. level .. "Title"] = { fg = color }
		theme["Notify" .. level .. "Body"] = { fg = p.color200, bg = p.color700 }
	end

	return theme
end

return M
