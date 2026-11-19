-- Language fixture manifest for the highlight coverage check.
--
-- Add one entry per language fixture. `module` is the basename of the file
-- under lua/yugen-ash/groups/langs/, `parser` is the Treesitter language id,
-- and `syntax` is the name of the legacy vim syntax file (usually filetype).
-- `common` lists base captures/groups every fixture for this language must
-- demonstrate; they are resolved through links and Treesitter fallbacks.

return {
	ruby = {
		file = "ruby.rb",
		filetype = "ruby",
		parser = "ruby",
		syntax = "ruby",
		module = "ruby",
		vim_g = {
			ruby_operators = 1,
			ruby_pseudo_operators = 1,
		},
		common = {
			"@comment",
			"@number",
			"@string",
			"@boolean",
			"@keyword",
			"@function",
			"@operator",
			"@punctuation.delimiter",
			"@punctuation.bracket",
			"@constant",
			"@type",
			"@variable",
			"@variable.member",
			"@variable.parameter",
			"Number",
			"String",
			"Boolean",
			"Keyword",
			"Function",
		},
	},
}
