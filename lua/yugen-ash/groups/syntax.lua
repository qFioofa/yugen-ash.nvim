-- Generic syntax highlight groups

local M = {}

function M.get(p, groups, styles)
	return {
		Constant = { fg = p.violet },
		String = { fg = p.sage },
		Character = { fg = p.sage },
		Number = { fg = p.violet },
		Boolean = { fg = p.tide },
		Float = { fg = p.violet },
		Identifier = { fg = p.color200 },
		Function = { fg = p.primary },
		Statement = { fg = p.color200 },
		Conditional = { fg = p.tide },
		Repeat = { fg = p.tide },
		Label = { fg = p.seafoam },
		Operator = { fg = p.frost },
		Keyword = { fg = p.crimson },
		Exception = { fg = p.tide },
		PreProc = { fg = p.crimson },
		Include = { fg = p.violet },
		Type = { fg = p.gold },
		Special = { fg = p.rust },
		Tag = { fg = p.primary },
		Delimiter = { fg = p.color200 },
		SpecialComment = { fg = p.color300 },
		Comment = { fg = p.color400 },
		Underlined = { style = "underline" },
		Bold = { style = "bold" },
		Italic = { style = "italic" },
	}
end

return M
