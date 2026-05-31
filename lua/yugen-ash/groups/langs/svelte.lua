-- Svelte language groups (.svelte) — vimscript syntax + Treesitter

local M = {}

function M.get(p, groups, styles)
	return {
		-- Legacy svelte syntax groups (othree/leafgarland style)
		svelteTag = { fg = p.sage },
		svelteTagName = { fg = p.sage },
		svelteComponentName = { fg = p.gold },
		svelteAttribute = { fg = p.gold, style = styles.italic },
		svelteAttributeName = { fg = p.gold, style = styles.italic },
		svelteDirective = { fg = p.crimson },
		svelteKeyword = { fg = p.crimson },
		svelteConditional = { fg = p.tide },
		svelteRepeat = { fg = p.tide },
		svelteBraces = { fg = p.coral },
		svelteBlockKeyword = { fg = p.crimson },
		svelteString = { fg = p.sage },

		-- Svelte Treesitter
		["@tag.svelte"] = { fg = p.sage },
		["@tag.builtin.svelte"] = { fg = p.crimson },
		["@tag.attribute.svelte"] = { fg = p.gold, style = styles.italic },
		["@tag.delimiter.svelte"] = { fg = p.color400 },
		["@keyword.svelte"] = { fg = p.crimson },
		["@keyword.conditional.svelte"] = { fg = p.tide },
		["@keyword.repeat.svelte"] = { fg = p.tide },
		["@keyword.import.svelte"] = { fg = p.violet },
		["@constant.svelte"] = { fg = p.violet },
		["@punctuation.special.svelte"] = { fg = p.coral },
		["@punctuation.bracket.svelte"] = { fg = p.coral },
		["@property.svelte"] = { fg = p.gold, style = styles.italic },
		["@type.svelte"] = { fg = p.gold },
		["@function.svelte"] = { fg = p.primary },
		["@variable.svelte"] = { fg = p.color200 },
	}
end

return M
