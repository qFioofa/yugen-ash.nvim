-- akinsho/toggleterm.nvim
-- Floating terminals only use the NormalFloat/FloatBorder variants, but the
-- split variants are themed too so every direction keeps the same palette.

local M = {}

function M.get(p, groups, styles)
	local theme = {
		WinBarActive = { fg = p.primary, style = "underline" },
		WinBarInactive = { fg = p.color400 },
	}

	local ids = { "Default" }
	for i = 1, 9 do
		ids[#ids + 1] = tostring(i)
	end

	for _, id in ipairs(ids) do
		local prefix = "ToggleTerm" .. id
		theme[prefix .. "Normal"] = { fg = p.color200, bg = p.color700 }
		theme[prefix .. "NormalFloat"] = { fg = p.color200, bg = p.color700 }
		theme[prefix .. "FloatBorder"] = { fg = groups.border, bg = p.color700 }
		theme[prefix .. "SignColumn"] = { bg = p.color700 }
		theme[prefix .. "EndOfBuffer"] = { fg = p.color500, bg = p.color700 }
		theme[prefix .. "StatusLine"] = { fg = p.color200, bg = p.color700 }
		theme[prefix .. "StatusLineNC"] = { fg = p.color400, bg = p.color700 }
		theme[prefix .. "WinBar"] = { fg = p.color300, bg = p.color700 }
		theme[prefix .. "WinBarNC"] = { fg = p.color400, bg = p.color700 }
	end

	return theme
end

return M
