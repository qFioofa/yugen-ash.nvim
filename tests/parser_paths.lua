-- Adds common nvim-treesitter parser locations to runtimepath.
--
-- The fixtures are opened with a minimal init, so plugin managers have not
-- added their runtime paths. This keeps Treesitter coverage working when a
-- parser is installed under the usual lazy.nvim / pack locations. Extra paths
-- can be supplied through YUGEN_ASH_PARSER_PATH (colon-separated).

local M = {}

local function fs_stat(path)
	return (vim.uv or vim.loop).fs_stat(path) ~= nil
end

function M.add()
	local data = vim.fn.stdpath("data")
	local candidates = {
		data .. "/lazy/nvim-treesitter",
		data .. "/site/pack/core/opt/nvim-treesitter",
	}

	for _, pattern in ipairs({
		data .. "/site/pack/*/opt/nvim-treesitter",
		data .. "/site/pack/*/start/nvim-treesitter",
	}) do
		for _, path in ipairs(vim.fn.glob(pattern, false, true)) do
			candidates[#candidates + 1] = path
		end
	end

	if vim.env.YUGEN_ASH_PARSER_PATH then
		for path in vim.env.YUGEN_ASH_PARSER_PATH:gmatch("[^:]+") do
			candidates[#candidates + 1] = path
		end
	end

	for _, path in ipairs(candidates) do
		if fs_stat(path .. "/parser") then
			vim.opt.runtimepath:append(path)
		end
	end
end

return M
