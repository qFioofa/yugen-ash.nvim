-- stevearc/aerial.nvim — per-kind icons follow the syntax color scheme

local M = {}

function M.get(p, groups, styles)
	return {
		AerialLine = { fg = p.color200, bg = p.color600 },
		AerialLineNC = { fg = p.color200 },
		AerialGuide = { fg = p.color600 },
		AerialNormal = { fg = p.color200 },

		AerialFileIcon = { fg = p.color300 },
		AerialModuleIcon = { fg = p.violet },
		AerialNamespaceIcon = { fg = p.violet },
		AerialPackageIcon = { fg = p.violet },
		AerialClassIcon = { fg = p.gold },
		AerialMethodIcon = { fg = p.gold },
		AerialPropertyIcon = { fg = p.color300 },
		AerialFieldIcon = { fg = p.color500 },
		AerialConstructorIcon = { fg = p.gold },
		AerialEnumIcon = { fg = p.gold },
		AerialInterfaceIcon = { fg = p.gold },
		AerialFunctionIcon = { fg = p.primary },
		AerialVariableIcon = { fg = p.color200 },
		AerialConstantIcon = { fg = p.violet },
		AerialStringIcon = { fg = p.sage },
		AerialNumberIcon = { fg = p.violet },
		AerialBooleanIcon = { fg = p.tide },
		AerialArrayIcon = { fg = p.gold },
		AerialObjectIcon = { fg = p.gold },
		AerialKeyIcon = { fg = p.tide },
		AerialNullIcon = { fg = p.tide },
		AerialEnumMemberIcon = { fg = p.violet },
		AerialStructIcon = { fg = p.crimson },
		AerialEventIcon = { fg = p.gold },
		AerialOperatorIcon = { fg = p.frost },
		AerialTypeParameterIcon = { fg = p.gold },
	}
end

return M
