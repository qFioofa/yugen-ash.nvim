-- SQL language groups (.sql) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy sql.vim syntax groups
		sqlStatement = { fg = p.crimson },
		sqlKeyword = { fg = p.crimson },
		sqlSpecial = { fg = p.rust },
		sqlConditional = { fg = p.tide },
		sqlOperator = { fg = p.frost },
		sqlFunction = { fg = p.primary },
		sqlType = { fg = p.gold },
		sqlString = { fg = p.sage },
		sqlNumber = { fg = p.violet },
		sqlComment = { fg = p.color400 },
		sqlVariable = { fg = p.color200 },
		sqlTable = { fg = p.gold },
		sqlColumn = { fg = p.color300 },
		sqlParen = { fg = p.color400 },
		sqlError = { fg = p.error },

		-- SQL Treesitter
		["@keyword.sql"] = { fg = p.crimson },
		["@type.sql"] = { fg = p.gold },
		["@type.builtin.sql"] = { fg = p.amber },
		["@function.sql"] = { fg = p.primary },
		["@function.builtin.sql"] = { fg = p.primary },
		["@function.call.sql"] = { fg = p.primary },
		["@string.sql"] = { fg = p.sage },
		["@number.sql"] = { fg = p.violet },
		["@boolean.sql"] = { fg = p.tide },
		["@constant.builtin.sql"] = { fg = p.violet },
		["@operator.sql"] = { fg = p.frost },
		["@field.sql"] = { fg = p.color300 },
		["@variable.member.sql"] = { fg = p.color300 },
		["@attribute.sql"] = { fg = p.amber },
		["@punctuation.delimiter.sql"] = { fg = p.color400 },
		["@punctuation.bracket.sql"] = { fg = p.color400 },
		["@comment.sql"] = { fg = p.color400 },
	}
end

return M
