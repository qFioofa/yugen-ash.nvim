-- CMake language groups (CMakeLists.txt / .cmake) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy cmake.vim syntax groups
		cmakeStatement = { fg = p.crimson },
		cmakeCommand = { fg = p.primary },
		cmakeKeyword = { fg = p.crimson },
		cmakeArguments = { fg = p.color200 },
		cmakeVariable = { fg = p.violet },
		cmakeVariableValue = { fg = p.violet },
		cmakeProperty = { fg = p.gold },
		cmakeModule = { fg = p.gold },
		cmakeString = { fg = p.sage },
		cmakeGeneratorExpression = { fg = p.coral },
		cmakeGeneratorExpressions = { fg = p.coral },
		cmakeRegistry = { fg = p.amber },
		cmakeEscaped = { fg = p.gold },
		cmakeComment = { fg = p.color400 },
		cmakeTodo = { fg = p.gold, style = "bold" },

		-- CMake Treesitter
		["@keyword.cmake"] = { fg = p.crimson },
		["@function.cmake"] = { fg = p.primary },
		["@function.builtin.cmake"] = { fg = p.primary },
		["@function.call.cmake"] = { fg = p.primary },
		["@variable.cmake"] = { fg = p.color200 },
		["@constant.cmake"] = { fg = p.violet },
		["@string.cmake"] = { fg = p.sage },
		["@operator.cmake"] = { fg = p.frost },
		["@property.cmake"] = { fg = p.gold },
		["@punctuation.special.cmake"] = { fg = p.coral },
		["@punctuation.bracket.cmake"] = { fg = p.color400 },
		["@comment.cmake"] = { fg = p.color400 },
	}
end

return M
