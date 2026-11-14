-- L3MON4D3/LuaSnip
-- LuaSnip applies these groups through its default ext_opts. Only the active,
-- visited and unvisited states need a visual difference; passive nodes keep the
-- syntax colors from the buffer.

local M = {}

function M.get(p, groups, styles)
	local active = { bg = p.color600 }
	local visited = { fg = p.color400 }
	local unvisited = { fg = p.color200 }

	local theme = {
		LuasnipTextNodeActive = active,
		LuasnipInsertNodeActive = active,
		LuasnipExitNodeActive = active,
		LuasnipFunctionNodeActive = active,
		LuasnipSnippetNodeActive = active,
		LuasnipChoiceNodeActive = { bg = p.color600, style = "bold" },
		LuasnipDynamicNodeActive = active,
		LuasnipRestoreNodeActive = active,
		LuasnipSnippetActive = active,

		LuasnipTextNodeVisited = visited,
		LuasnipInsertNodeVisited = visited,
		LuasnipExitNodeVisited = visited,
		LuasnipFunctionNodeVisited = visited,
		LuasnipSnippetNodeVisited = visited,
		LuasnipChoiceNodeVisited = visited,
		LuasnipDynamicNodeVisited = visited,
		LuasnipRestoreNodeVisited = visited,

		LuasnipTextNodeUnvisited = unvisited,
		LuasnipInsertNodeUnvisited = unvisited,
		LuasnipExitNodeUnvisited = unvisited,
		LuasnipFunctionNodeUnvisited = unvisited,
		LuasnipSnippetNodeUnvisited = unvisited,
		LuasnipChoiceNodeUnvisited = unvisited,
		LuasnipDynamicNodeUnvisited = unvisited,
		LuasnipRestoreNodeUnvisited = unvisited,
	}

	-- Same style for every node type's snippet_passive state would hide the
	-- syntax colors, so those groups are intentionally left undefined.

	return theme
end

return M
