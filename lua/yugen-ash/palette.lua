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
		dawn = "#FFD3B6",
		moss = "#6A8A6A",
		clay = "#A57C65",
		amber = "#D4A76A",
		slate = "#5D6D7E",
		pine = "#3A5F4A",
		coral = "#FF9E8B",
		ash = "#7A7A7A",
		ember = "#B35A3A",
		mist = "#A8C4C4",
		flint = "#5A6B7C",
		bloom = "#C38B9E",
		drift = "#B6C8D9",
		umber = "#8A6A4D",
		fjord = "#4A6A6A",
		-- Code accents
		violet = "#c678dd",
		crimson = "#bf616a",
		tide = "#79a0aa",
		sage = "#9db89c",
		gold = "#D4A017",
		seafoam = "#8dd3c3",
		rust = "#bc735c",
		frost = "#96a8ad",
		none = "none",
	},
}

local palette = {}

palette = variants.main

return palette
