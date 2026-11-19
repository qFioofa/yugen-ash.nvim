-- Minimal init for manually opening a language fixture with yugen-ash.
--
-- Usage:
--   nvim -u tests/minimal_init.lua tests/fixtures/langs/ruby.rb
--   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/ruby.rb

local source = debug.getinfo(1, "S").source:sub(2)
local root = vim.fn.fnamemodify(source, ":p:h:h")

vim.opt.runtimepath:prepend(root)
dofile(root .. "/tests/parser_paths.lua").add()
vim.opt.termguicolors = true
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

require("yugen-ash").setup({
	compile = false,
	variant = vim.env.YUGEN_ASH_VARIANT or "main",
})
vim.cmd("colorscheme yugen-ash")

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		vim.schedule(function()
			if not vim.api.nvim_buf_is_valid(args.buf) then
				return
			end
			local syntax = vim.bo[args.buf].syntax
			if syntax == "" then
				syntax = vim.bo[args.buf].filetype
			end
			pcall(vim.treesitter.start, args.buf)
			-- vim.treesitter.start() clears 'syntax'; restore legacy highlighting.
			if syntax ~= "" then
				vim.api.nvim_buf_call(args.buf, function()
					pcall(vim.cmd, "runtime! syntax/" .. syntax .. ".vim")
					vim.bo.syntax = syntax
				end)
			end
		end)
	end,
})
