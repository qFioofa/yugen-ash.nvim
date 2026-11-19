-- rcarriga/nvim-notify
-- Per level: Border, Icon, Title (the level color) and Body (normal text).

local M = {}

function M.get(p, groups, styles)
	local levels = {
		ERROR = groups.error,
		WARN = groups.warn,
		INFO = groups.info,
		DEBUG = p.color400,
		TRACE = p.violet,
	}

	local theme = {}
	for level, color in pairs(levels) do
		theme["Notify" .. level .. "Border"] = { fg = color }
		theme["Notify" .. level .. "Icon"] = { fg = color }
		theme["Notify" .. level .. "Title"] = { fg = color }
		theme["Notify" .. level .. "Body"] = { fg = p.color200, bg = styles.panel }
	end

	return theme
end

return M
