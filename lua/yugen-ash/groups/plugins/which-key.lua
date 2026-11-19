-- folke/which-key.nvim

local M = {}

function M.get(p, groups, styles)
	return {
		WhichKey = { fg = p.primary },
		WhichKeyGroup = { fg = p.tide },
		WhichKeyDesc = { fg = p.color200 },
		WhichKeySeparator = { fg = p.color500 },
		WhichKeyValue = { fg = p.color400 },
		WhichKeyNormal = { fg = p.color200, bg = styles.panel },
		WhichKeyFloat = { bg = styles.panel },
		WhichKeyBorder = { fg = groups.border },
		WhichKeyTitle = { fg = p.color200, bg = styles.panel },
	}
end

return M
