-- Nix language groups (.nix) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy vim-nix syntax groups
		nixKeyword = { fg = p.crimson },
		nixBuiltin = { fg = p.crimson },
		nixSimpleBuiltin = { fg = p.crimson },
		nixNamespacedBuiltin = { fg = p.crimson },
		nixConditional = { fg = p.tide },
		nixOperator = { fg = p.frost },
		nixBoolean = { fg = p.tide },
		nixNull = { fg = p.violet },
		nixInteger = { fg = p.violet },
		nixFloat = { fg = p.violet },
		nixString = { fg = p.sage },
		nixStringDelimiter = { fg = p.sage },
		nixSimpleString = { fg = p.sage },
		nixIndentedString = { fg = p.sage },
		nixStringSpecial = { fg = p.rust },
		nixInterpolation = { fg = p.coral },
		nixInterpolationDelimiter = { fg = p.coral },
		nixInterpolationParam = { fg = p.coral },
		nixComment = { fg = p.color400 },
		nixAttribute = { fg = p.color300 },
		nixAttributeDot = { fg = p.color400 },
		nixPath = { fg = p.seafoam },
		nixHomePath = { fg = p.seafoam },
		nixSearchPath = { fg = p.seafoam },
		nixURI = { fg = p.seafoam, style = "underline" },
		nixFunctionCall = { fg = p.primary },
		nixArgumentDefinition = { fg = p.color200 },
		nixArgOperator = { fg = p.frost },
		nixInherit = { fg = p.crimson },

		-- Nix Treesitter
		["@keyword.nix"] = { fg = p.crimson },
		["@keyword.import.nix"] = { fg = p.crimson },
		["@function.builtin.nix"] = { fg = p.primary },
		["@function.call.nix"] = { fg = p.primary },
		["@variable.parameter.nix"] = { fg = p.color200 },
		["@variable.member.nix"] = { fg = p.color300 },
		["@property.nix"] = { fg = p.color300 },
		["@constant.builtin.nix"] = { fg = p.tide },
		["@string.special.path.nix"] = { fg = p.seafoam },
		["@string.special.uri.nix"] = { fg = p.seafoam, style = "underline" },
		["@punctuation.special.nix"] = { fg = p.coral },
		["@operator.nix"] = { fg = p.frost },
	}
end

return M
