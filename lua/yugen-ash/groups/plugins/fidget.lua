-- j-hui/fidget.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		FidgetNoBlend = { bg = p.color700 },
		-- Kept for older Fidget versions; the current release uses Comment for
		-- notification text, which the syntax module already themes.
		FidgetTitle = { fg = p.primary, style = styles.bold },
		FidgetTask = { fg = p.color300 },
	}
end

return M
