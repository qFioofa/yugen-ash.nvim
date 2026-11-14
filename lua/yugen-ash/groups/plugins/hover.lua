-- lewis6991/hover.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		HoverWindow = { fg = p.color200, bg = p.color700 },
		HoverBorder = { fg = groups.border, bg = p.color700 },
		HoverSourceLine = { fg = p.color400, bg = p.color700 },
		HoverActiveSource = { fg = p.color800, bg = p.primary, style = "bold" },
		HoverInactiveSource = { fg = p.color400, bg = p.color700 },
		HoverFloatingError = { fg = p.error, bg = p.color700 },
		HoverFloatingWarn = { fg = p.warning, bg = p.color700 },
		HoverFloatingInfo = { fg = p.tide, bg = p.color700 },
		HoverFloatingHint = { fg = p.success, bg = p.color700 },
	}
end

return M
