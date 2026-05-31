-- SmiteshP/nvim-navic — per-kind icons follow the syntax color scheme

local M = {}

function M.get(p, groups, styles)
	return {
		NavicText = { fg = p.color200 },
		NavicSeparator = { fg = p.color400 },

		NavicIconsFile = { fg = p.color300 },
		NavicIconsModule = { fg = p.violet },
		NavicIconsNamespace = { fg = p.violet },
		NavicIconsPackage = { fg = p.violet },
		NavicIconsClass = { fg = p.gold },
		NavicIconsMethod = { fg = p.gold },
		NavicIconsProperty = { fg = p.color300 },
		NavicIconsField = { fg = p.color500 },
		NavicIconsConstructor = { fg = p.gold },
		NavicIconsEnum = { fg = p.gold },
		NavicIconsInterface = { fg = p.gold },
		NavicIconsFunction = { fg = p.primary },
		NavicIconsVariable = { fg = p.color200 },
		NavicIconsConstant = { fg = p.violet },
		NavicIconsString = { fg = p.sage },
		NavicIconsNumber = { fg = p.violet },
		NavicIconsBoolean = { fg = p.tide },
		NavicIconsArray = { fg = p.gold },
		NavicIconsObject = { fg = p.gold },
		NavicIconsKey = { fg = p.tide },
		NavicIconsNull = { fg = p.tide },
		NavicIconsEnumMember = { fg = p.violet },
		NavicIconsStruct = { fg = p.crimson },
		NavicIconsEvent = { fg = p.gold },
		NavicIconsOperator = { fg = p.frost },
		NavicIconsTypeParameter = { fg = p.gold },
	}
end

return M
