-- Protocol Buffers language groups (.proto) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy proto.vim syntax groups
		pbSyntax = { fg = p.crimson },
		pbSyntaxName = { fg = p.gold },
		pbPackage = { fg = p.violet },
		pbPackageName = { fg = p.gold },
		pbImport = { fg = p.crimson },
		pbOption = { fg = p.crimson },
		pbKeyword = { fg = p.crimson },
		pbBool = { fg = p.tide },
		pbType = { fg = p.gold },
		pbTypeKeyword = { fg = p.crimson },
		pbField = { fg = p.color300 },
		pbFieldRule = { fg = p.crimson },
		pbFieldDefault = { fg = p.violet },
		pbEnum = { fg = p.crimson },
		pbEnumName = { fg = p.gold },
		pbMessage = { fg = p.crimson },
		pbMessageName = { fg = p.gold },
		pbService = { fg = p.crimson },
		pbServiceName = { fg = p.gold },
		pbRpc = { fg = p.crimson },
		pbString = { fg = p.sage },
		pbInt = { fg = p.violet },
		pbFloat = { fg = p.violet },
		pbComment = { fg = p.color400 },

		-- Protobuf Treesitter
		["@keyword.proto"] = { fg = p.crimson },
		["@keyword.import.proto"] = { fg = p.crimson },
		["@type.proto"] = { fg = p.gold },
		["@type.builtin.proto"] = { fg = p.amber },
		["@type.definition.proto"] = { fg = p.gold },
		["@constant.proto"] = { fg = p.tide },
		["@constant.builtin.proto"] = { fg = p.tide },
		["@field.proto"] = { fg = p.color300 },
		["@variable.member.proto"] = { fg = p.color300 },
		["@string.proto"] = { fg = p.sage },
		["@number.proto"] = { fg = p.violet },
		["@boolean.proto"] = { fg = p.tide },
		["@operator.proto"] = { fg = p.frost },
		["@punctuation.delimiter.proto"] = { fg = p.color400 },
		["@comment.proto"] = { fg = p.color400 },
	}
end

return M
