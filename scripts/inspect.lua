-- Headless wrapper for the read-only inspector.
--
-- Usage:
--   nvim -l scripts/inspect.lua [group]
--
-- Without a group it inspects the cursor position (useful when the script is
-- sourced from a real buffer); with a group it prints the definition, link
-- chain, and resolved colors.

local script = debug.getinfo(1, "S").source:sub(2)
local root = vim.fn.fnamemodify(script, ":h:h")

vim.opt.runtimepath:prepend(root)
require("yugen-ash").setup({ compile = false })
vim.cmd("colorscheme yugen-ash")

local args = _G.arg or {}
require("yugen-ash.inspect").show(args[1], false)
