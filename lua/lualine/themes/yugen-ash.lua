-- nvim-lualine/lualine.nvim
--
-- Lualine is themed through a theme module (not named highlight groups), so it
-- lives here under lua/lualine/themes/ rather than in yugen-ash/groups/plugins.
-- Colors are pulled from the active variant's palette so the statusline tracks
-- whichever variant was passed to require("yugen-ash").setup().

local ok, yugen = pcall(require, "yugen-ash")
local variant = (ok and yugen.get_config and yugen.get_config().variant) or "main"
local p = require("yugen-ash.palette").get(variant)

-- Shared middle/end sections, consistent across every mode.
local b = { fg = p.color200, bg = p.color600 }
local c = { fg = p.color300, bg = p.color700 }

-- The mode indicator (section a) carries the only splash of color: dark text
-- on an accent background, matching the theme's minimal dark aesthetic.
local function mode(accent)
	return {
		a = { fg = p.color800, bg = accent, gui = "bold" },
		b = b,
		c = c,
	}
end

return {
	normal = mode(p.crimson),
	insert = mode(p.success),
	visual = mode(p.warning),
	replace = mode(p.error),
	command = mode(p.amber),
	terminal = mode(p.seafoam),
	inactive = {
		a = { fg = p.color400, bg = p.color700, gui = "bold" },
		b = { fg = p.color400, bg = p.color700 },
		c = { fg = p.color400, bg = p.color700 },
	},
}
