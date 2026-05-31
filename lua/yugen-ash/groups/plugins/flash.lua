-- folke/flash.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		FlashBackdrop = { fg = p.color400 },
		FlashMatch = { fg = p.color200, bg = p.color600 },
		FlashCurrent = { fg = p.color800, bg = p.primary, style = "bold" },
		FlashLabel = { fg = p.color800, bg = p.crimson, style = "bold" },
		FlashPrompt = { fg = p.color200, bg = p.color700 },
		FlashPromptIcon = { fg = p.primary },
		FlashCursor = { link = "Cursor" },
	}
end

return M
