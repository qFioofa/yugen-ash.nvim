-- C / C++ language groups (.c and .h files) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- C specific syntax groups (matching .c and .h files)
		cTypedef = { fg = p.crimson },
		cPreCondit = { fg = p.crimson },
		cStructure = { fg = p.crimson },
		cType = { fg = p.gold },
		cStorageClass = { fg = p.crimson },
		cInclude = { fg = p.crimson },
		cDefine = { fg = p.crimson },
		cMacro = { fg = p.violet },
		cSpecial = { fg = p.rust },
		cCommentString = { fg = p.sage },
		cCommentSkip = { fg = p.color400 },
		cComment2 = { fg = p.color400 },
		cConstant = { fg = p.tide },
		cInteger = { fg = p.violet },
		cFloat = { fg = p.violet },
		cString = { fg = p.sage },
		cCharacter = { fg = p.sage },
		cOperator = { fg = p.frost },
		cLabel = { fg = p.seafoam },
		cConditional = { fg = p.tide },
		cRepeat = { fg = p.tide },
		cStatement = { fg = p.color200 },
		cException = { fg = p.tide },
		cSpecialChar = { fg = p.rust },
		cSpecialComment = { fg = p.color400 },

		-- C Treesitter
		["@type.c"] = { fg = p.gold },
		["@type.builtin.c"] = { fg = p.amber },
		["@keyword.c"] = { fg = p.crimson },
		["@keyword.storage.c"] = { fg = p.crimson },
		["@keyword.function.c"] = { fg = p.crimson },
		["@preproc.c"] = { fg = p.crimson },
		["@preproc.define.c"] = { fg = p.violet, style = "bold" },
		["@preproc.include.c"] = { fg = p.crimson },
		["@constant.c"] = { fg = p.tide },
		["@macro.c"] = { fg = p.violet, style = "bold" },
		["@structure.c"] = { fg = p.crimson },
		["@union.c"] = { fg = p.crimson },
		["@enum.c"] = { fg = p.crimson },
	}
end

return M
