-- Adapted from yugen.nvim
-- Source: https://github.com/bettervim/yugen.nvim
-- Original Copyright (c) 2023 bettervim
-- MIT Licensed

local utils = {}

local function byte(value, offset)
	return bit.band(bit.rshift(value, offset), 0xFF)
end

local function rgb(color)
	color = vim.api.nvim_get_color_by_name(color)

	if color == -1 then
		color = vim.opt.background:get() == "dark" and 000 or 255255255
	end

	return { byte(color, 16), byte(color, 8), byte(color, 0) }
end

local function parse_color(color)
	if color == nil then
		return print("invalid color")
	end

	color = color:lower()

	if not color:find("#") and color ~= "none" then
		color = require("yugen-ash.palette")[color] or vim.api.nvim_get_color_by_name(color)
	end

	return color
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 (background) and 1 (foreground)
utils.blend = function(fg, bg, alpha)
	fg = rgb(parse_color(fg))
	bg = rgb(parse_color(bg))

	local function blend_channel(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))
end

-- Normalize a color spec to a value accepted by nvim_set_hl, or nil when the
-- attribute should be left unset ("none"/missing/unresolvable).
local function color_value(color)
	if not color then
		return nil
	end

	local value = parse_color(color)
	if value == nil or value == "none" or value == -1 then
		return nil
	end

	return value
end

---@param group string
---@param color table<string, string>
utils.highlight = function(group, color)
	-- A link supersedes any other attribute, matching the previous behavior
	-- where `highlight! link` ran last.
	if color.link then
		vim.api.nvim_set_hl(0, group, { link = color.link })
		return
	end

	local hl = {
		fg = color_value(color.fg),
		bg = color_value(color.bg),
		sp = color_value(color.sp),
	}

	-- `style` is a comma-separated list of gui attributes (e.g. "bold,underline").
	if color.style then
		for attr in string.gmatch(color.style, "[^,]+") do
			attr = attr:match("^%s*(.-)%s*$")
			if attr ~= "" and attr ~= "none" then
				hl[attr] = true
			end
		end
	end

	vim.api.nvim_set_hl(0, group, hl)
end

return utils
