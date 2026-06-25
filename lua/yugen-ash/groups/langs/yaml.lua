-- YAML language groups (.yaml / .yml) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy yaml.vim syntax groups
		yamlBlockMappingKey = { fg = p.tide },
		yamlKey = { fg = p.tide },
		yamlKeyValueDelimiter = { fg = p.color400 },
		yamlBlockMappingMerge = { fg = p.crimson },
		yamlBlockCollectionItemStart = { fg = p.color400 },
		yamlPlainScalar = { fg = p.color200 },
		yamlString = { fg = p.sage },
		yamlFlowString = { fg = p.sage },
		yamlFlowStringDelimiter = { fg = p.sage },
		yamlSingleQuote = { fg = p.sage },
		yamlDoubleQuote = { fg = p.sage },
		yamlEscape = { fg = p.rust },
		yamlBool = { fg = p.tide },
		yamlNull = { fg = p.violet },
		yamlInteger = { fg = p.violet },
		yamlFloat = { fg = p.violet },
		yamlTimestamp = { fg = p.violet },
		yamlComment = { fg = p.color400 },
		yamlAnchor = { fg = p.amber },
		yamlAlias = { fg = p.amber },
		yamlNodeTag = { fg = p.crimson },
		yamlDocumentStart = { fg = p.color400 },
		yamlDocumentEnd = { fg = p.color400 },
		yamlDirective = { fg = p.crimson },
		yamlFlowIndicator = { fg = p.color400 },
		yamlFlowMappingKey = { fg = p.tide },

		-- YAML Treesitter
		["@property.yaml"] = { fg = p.tide },
		["@field.yaml"] = { fg = p.tide },
		["@string.yaml"] = { fg = p.sage },
		["@boolean.yaml"] = { fg = p.tide },
		["@number.yaml"] = { fg = p.violet },
		["@constant.builtin.yaml"] = { fg = p.tide },
		["@type.yaml"] = { fg = p.crimson },
		["@label.yaml"] = { fg = p.amber },
		["@punctuation.delimiter.yaml"] = { fg = p.color400 },
		["@punctuation.special.yaml"] = { fg = p.coral },
		["@comment.yaml"] = { fg = p.color400 },
	}
end

return M
