-- Adapted from yugen.nvim
-- Source: https://github.com/bettervim/yugen.nvim
-- Original Copyright (c) 2023 bettervim
-- MIT Licensed

-- Modified by qfioofa:
-- - Changed colors

local utils = require("yugen-ash.utils")

local M = {}

local config = {
	bold_vert_split = false,
	variant = "main", -- main, rich, muted, vibrant, light
	transparent = false,
	transparent_statusline = false,
	disable_italics = false,
	dim_nc_background = false,
	compile = true, -- cache the compiled theme for faster startup

	groups = {
		background = "color700",
		panel = "color700",
		statusline = "color800",
		border = "color600",
		comment = "color400",
		link = "primary",
		punctuation = "color400",

		error = "error",
		hint = "success",
		info = "tide",
		warn = "warning",

		git_add = "sage",
		git_change = "warning",
		git_delete = "crimson",
		git_dirty = "color200",
		git_ignore = "color500",
		git_merge = "tide",
		git_rename = "coral",
		git_stage = "seafoam",
		git_text = "color200",

		headings = {
			h1 = "primary",
			h2 = "coral",
			h3 = "gold",
			h4 = "crimson",
			h5 = "violet",
			h6 = "tide",
		},
	},
	highlight_groups = {},
}

function M.setup(opts)
	opts = opts or {}
	config = vim.tbl_deep_extend("force", config, opts)

	vim.api.nvim_create_user_command("YugenAshClean", function()
		M.clean()
		vim.notify("yugen-ash: cache cleared", vim.log.levels.INFO)
	end, { desc = "Remove the yugen-ash compiled cache" })

	vim.api.nvim_create_user_command("YugenAshCompile", function()
		M.clean()
		M.colorscheme()
		vim.notify("yugen-ash: recompiled", vim.log.levels.INFO)
	end, { desc = "Rebuild the yugen-ash compiled cache and reload" })

	vim.api.nvim_create_user_command("YugenAshInspect", function(cmd)
		require("yugen-ash.inspect").show(cmd.args, cmd.bang)
	end, {
		nargs = "?",
		bang = true,
		desc = "Inspect the highlight group and effective color at the cursor",
	})
end

-- Exposes the resolved config so external integrations (e.g. the lualine
-- theme module) can pick up the active variant.
function M.get_config()
	return config
end

function M.colorscheme()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.opt.termguicolors = true
	vim.g.colors_name = "yugen-ash"

	if config.compile then
		local payload = require("yugen-ash.cache").load(config)
		for group, args in pairs(payload.highlights) do
			vim.api.nvim_set_hl(0, group, args)
		end
		for i = 0, 15 do
			vim.g["terminal_color_" .. i] = payload.terminal[i]
		end
		return
	end

	-- Uncached path: build and apply the theme directly. theme.get sets the
	-- terminal colors as a side effect.
	local theme = require("yugen-ash.theme").get(config)

	for group, color in pairs(theme) do
		if config.highlight_groups[group] == nil then
			utils.highlight(group, color)
		end
	end

	for group, color in pairs(config.highlight_groups) do
		utils.highlight(group, color)
	end
end

-- Removes the compiled theme caches. Call after editing the theme sources if
-- the mtime-based invalidation is bypassed, or to force a clean rebuild.
function M.clean()
	require("yugen-ash.cache").clean()
end

return M
