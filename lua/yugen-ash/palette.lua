-- Adapted from yugen.nvim
-- Source: https://github.com/bettervim/yugen.nvim
-- Original Copyright (c) 2023 bettervim
-- MIT Licensed

-- Modified by qfioofa:
-- - Changed color palette
-- - Added new highlight groups
-- - Removed unused components
-- - Replaced colors

local variants = {
	main = {
		placeholder = "#303030",
		-- Darks
		color100 = "#FAFAFA",
		color200 = "#D4D4D4",
		color300 = "#A9A9A9",
		color400 = "#696969",
		color500 = "#505050",
		color600 = "#303030",
		color700 = "#151515",
		color800 = "#000000",
		-- Accents
		primary = "#FFBE89",
		success = "#7EAB8E",
		warning = "#FFF2AF",
		error = "#F57A7A",

		-- Code accents
		violet = "#c678dd",
		crimson = "#bf616a",
		tide = "#79a0aa",
		sage = "#9db89c",
		none = "none",
	},
}

local palette = {}

palette = variants.main

return palette
