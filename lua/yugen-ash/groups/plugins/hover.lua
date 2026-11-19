-- lewis6991/hover.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		HoverWindow = { fg = p.color200, bg = styles.panel },
		HoverBorder = { fg = groups.border, bg = styles.panel },
		HoverSourceLine = { fg = p.color400, bg = styles.panel },
		HoverActiveSource = { fg = p.color800, bg = p.primary, style = styles.bold },
		HoverInactiveSource = { fg = p.color400, bg = styles.panel },
		HoverFloatingError = { fg = groups.error, bg = styles.panel },
		HoverFloatingWarn = { fg = groups.warn, bg = styles.panel },
		HoverFloatingInfo = { fg = groups.info, bg = styles.panel },
		HoverFloatingHint = { fg = groups.hint, bg = styles.panel },
	}
end

return M
