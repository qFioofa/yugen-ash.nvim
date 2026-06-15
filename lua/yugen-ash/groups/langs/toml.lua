-- TOML language groups (.toml) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy toml.vim syntax groups
		tomlTable = { fg = p.crimson },
		tomlTableArray = { fg = p.crimson },
		tomlKey = { fg = p.tide },
		tomlKeyValueArray = { fg = p.tide },
		tomlKeyDq = { fg = p.tide },
		tomlKeySq = { fg = p.tide },
		tomlString = { fg = p.sage },
		tomlEscape = { fg = p.rust },
		tomlBoolean = { fg = p.tide },
		tomlInteger = { fg = p.violet },
		tomlFloat = { fg = p.violet },
		tomlDate = { fg = p.violet },
		tomlComment = { fg = p.color400 },
		tomlDotInKey = { fg = p.color400 },

		-- TOML Treesitter
		["@property.toml"] = { fg = p.tide },
		["@type.toml"] = { fg = p.crimson },
		["@string.toml"] = { fg = p.sage },
		["@boolean.toml"] = { fg = p.tide },
		["@number.toml"] = { fg = p.violet },
		["@constant.builtin.toml"] = { fg = p.violet },
		["@punctuation.delimiter.toml"] = { fg = p.color400 },
		["@punctuation.bracket.toml"] = { fg = p.color400 },
		["@comment.toml"] = { fg = p.color400 },
	}
end

return M
