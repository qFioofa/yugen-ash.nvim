-- Makefile language groups (Makefile) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy make.vim syntax groups
		makeIdent = { fg = p.violet },
		makeSpecTarget = { fg = p.gold },
		makeSpecialTarget = { fg = p.gold },
		makeTarget = { fg = p.primary },
		makeStatement = { fg = p.crimson },
		makeCommands = { fg = p.color200 },
		makePreCondit = { fg = p.crimson },
		makeDefine = { fg = p.crimson },
		makeOverride = { fg = p.crimson },
		makeInclude = { fg = p.crimson },
		makeExport = { fg = p.crimson },
		makeImplicit = { fg = p.primary },
		makeSpecial = { fg = p.rust },
		makeComment = { fg = p.color400 },
		makeDString = { fg = p.sage },
		makeSString = { fg = p.sage },
		makeBString = { fg = p.sage },
		makeCmdNextLine = { fg = p.gold },

		-- Make Treesitter
		["@keyword.make"] = { fg = p.crimson },
		["@function.make"] = { fg = p.primary },
		["@function.builtin.make"] = { fg = p.primary },
		["@variable.make"] = { fg = p.violet },
		["@string.make"] = { fg = p.sage },
		["@operator.make"] = { fg = p.frost },
		["@symbol.make"] = { fg = p.gold },
		["@punctuation.special.make"] = { fg = p.coral },
		["@comment.make"] = { fg = p.color400 },
	}
end

return M
