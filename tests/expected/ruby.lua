-- Groups declared by groups/langs/ruby.lua that the bundled Ruby syntax and
-- the installed Treesitter highlight query do not emit.
--
-- Every entry must name the source that was checked. Add a group here only
-- after :Inspect / :synstack / the parser query confirms it is unreachable;
-- otherwise extend tests/fixtures/langs/ruby.rb instead.

return {
	unreachable = {
		-- Treesitter captures absent from nvim-treesitter's ruby query.
		["@attribute.ruby"] = "nvim-treesitter ruby highlights query has no @attribute capture",
		["@constructor.ruby"] = "nvim-treesitter ruby highlights query has no @constructor capture",
		["@function.method.ruby"] = "nvim-treesitter ruby highlights query emits @function / @function.call, "
			.. "not @function.method",
		["@method.call.ruby"] = "nvim-treesitter ruby highlights query has no @method.call capture",
		["@method.ruby"] = "nvim-treesitter ruby highlights query has no @method capture",
		["@property.ruby"] = "nvim-treesitter ruby highlights query uses @variable.member, not @property",
		["@type.builtin.ruby"] = "nvim-treesitter ruby highlights query has no @type.builtin capture",
		["@type.class.ruby"] = "nvim-treesitter ruby highlights query has no @type.class capture",
		["@type.definition.ruby"] = "nvim-treesitter ruby highlights query has no @type.definition capture",

		-- Legacy groups absent from the bundled syntax/ruby.vim.
		rubyBlock = "not defined by bundled $VIMRUNTIME/syntax/ruby.vim (vim-ruby legacy group)",
		rubyFunction = "only used as a link target by bundled syntax/ruby.vim; no direct match",
		rubyHash = "not defined by bundled $VIMRUNTIME/syntax/ruby.vim (vim-ruby legacy group)",
		rubyLocalVariable = "not defined by bundled $VIMRUNTIME/syntax/ruby.vim (vim-ruby legacy group)",
		rubyLocalVariableOrMethod = "not defined by bundled $VIMRUNTIME/syntax/ruby.vim (vim-ruby legacy group)",
		rubyNumber = "bundled syntax/ruby.vim emits rubyInteger / rubyFloat, not rubyNumber",
		rubyReservedWord = "not defined by bundled $VIMRUNTIME/syntax/ruby.vim (vim-ruby legacy group)",
		rubySelf = "not defined by bundled $VIMRUNTIME/syntax/ruby.vim (vim-ruby legacy group)",
	},
}
