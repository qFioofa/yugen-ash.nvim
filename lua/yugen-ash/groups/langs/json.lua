-- JSON / JSONC language groups (.json / .jsonc) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy json.vim syntax groups
		jsonString = { fg = p.sage },
		jsonStringSQ = { fg = p.sage },
		jsonKeyword = { fg = p.tide },
		jsonKeywordMatch = { fg = p.color400 },
		jsonQuote = { fg = p.color400 },
		jsonBraces = { fg = p.color400 },
		jsonBoolean = { fg = p.tide },
		jsonNull = { fg = p.violet },
		jsonNumber = { fg = p.violet },
		jsonNoise = { fg = p.color400 },
		jsonEscape = { fg = p.rust },
		jsonComment = { fg = p.color400 },
		jsoncComment = { fg = p.color400 },

		-- JSON Treesitter
		["@property.json"] = { fg = p.tide },
		["@label.json"] = { fg = p.tide },
		["@string.json"] = { fg = p.sage },
		["@number.json"] = { fg = p.violet },
		["@boolean.json"] = { fg = p.tide },
		["@constant.builtin.json"] = { fg = p.tide },
		["@punctuation.bracket.json"] = { fg = p.color400 },
		["@punctuation.delimiter.json"] = { fg = p.color400 },
		["@string.escape.json"] = { fg = p.rust },

		-- JSONC Treesitter
		["@property.jsonc"] = { fg = p.tide },
		["@string.jsonc"] = { fg = p.sage },
		["@number.jsonc"] = { fg = p.violet },
		["@boolean.jsonc"] = { fg = p.tide },
		["@comment.jsonc"] = { fg = p.color400 },
		["@punctuation.bracket.jsonc"] = { fg = p.color400 },
		["@punctuation.delimiter.jsonc"] = { fg = p.color400 },
	}
end

return M
