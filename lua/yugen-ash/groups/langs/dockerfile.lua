-- Dockerfile language groups (Dockerfile) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy dockerfile.vim syntax groups
		dockerfileKeyword = { fg = p.crimson },
		dockerfileFroms = { fg = p.crimson },
		dockerfileInstruction = { fg = p.crimson },
		dockerfileOption = { fg = p.amber },
		dockerfileString = { fg = p.sage },
		dockerfileColor = { fg = p.violet },
		dockerfileEnv = { fg = p.violet },
		dockerfileBytes = { fg = p.violet },
		dockerfileTag = { fg = p.gold },
		dockerfileComment = { fg = p.color400 },
		dockerfileFirst = { fg = p.crimson },
		dockerfileShell = { fg = p.color200 },

		-- Dockerfile Treesitter
		["@keyword.dockerfile"] = { fg = p.crimson },
		["@string.dockerfile"] = { fg = p.sage },
		["@variable.dockerfile"] = { fg = p.color200 },
		["@property.dockerfile"] = { fg = p.tide },
		["@constant.dockerfile"] = { fg = p.violet, style = "bold" },
		["@operator.dockerfile"] = { fg = p.frost },
		["@function.dockerfile"] = { fg = p.primary },
		["@punctuation.special.dockerfile"] = { fg = p.coral },
		["@comment.dockerfile"] = { fg = p.color400 },
	}
end

return M
