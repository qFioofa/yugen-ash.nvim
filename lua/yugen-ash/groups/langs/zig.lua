-- Zig language groups (.zig) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy zig.vim syntax groups
		zigKeyword = { fg = p.crimson },
		zigStorage = { fg = p.crimson },
		zigStructure = { fg = p.crimson },
		zigStatement = { fg = p.crimson },
		zigConditional = { fg = p.tide },
		zigRepeat = { fg = p.tide },
		zigExecution = { fg = p.tide },
		zigException = { fg = p.tide },
		zigType = { fg = p.gold },
		zigTypeStyle = { fg = p.amber },
		zigBuiltinType = { fg = p.amber },
		zigBuiltinFn = { fg = p.crimson },
		zigBuiltin = { fg = p.amber },
		zigConstant = { fg = p.tide },
		zigBoolean = { fg = p.tide },
		zigNull = { fg = p.violet },
		zigDecNumber = { fg = p.violet },
		zigHexNumber = { fg = p.violet },
		zigFloat = { fg = p.violet },
		zigString = { fg = p.sage },
		zigMultilineString = { fg = p.sage },
		zigCharacter = { fg = p.sage },
		zigStringEscape = { fg = p.rust },
		zigOperator = { fg = p.frost },
		zigComment = { fg = p.color400 },
		zigDocComment = { fg = p.color400 },
		zigVarDecl = { fg = p.crimson },
		zigPubKeyword = { fg = p.crimson },
		zigLabel = { fg = p.seafoam },

		-- Zig Treesitter
		["@keyword.zig"] = { fg = p.crimson },
		["@keyword.function.zig"] = { fg = p.crimson },
		["@keyword.coroutine.zig"] = { fg = p.tide },
		["@keyword.return.zig"] = { fg = p.crimson },
		["@type.zig"] = { fg = p.gold },
		["@type.builtin.zig"] = { fg = p.amber },
		["@function.zig"] = { fg = p.primary },
		["@function.builtin.zig"] = { fg = p.primary },
		["@constant.zig"] = { fg = p.violet, style = "bold" },
		["@constant.builtin.zig"] = { fg = p.tide },
		["@variable.builtin.zig"] = { fg = p.color300 },
		["@field.zig"] = { fg = p.color300 },
		["@label.zig"] = { fg = p.seafoam },
		["@string.escape.zig"] = { fg = p.rust },
		["@attribute.zig"] = { fg = p.amber },
	}
end

return M
