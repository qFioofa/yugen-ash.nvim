-- NeogitOrg/neogit

local M = {}

function M.get(p, groups, styles)
	return {
		NeogitBranch = { fg = p.tide, style = "bold" },
		NeogitRemote = { fg = p.violet, style = "bold" },
		NeogitHunkHeader = { fg = p.color200, bg = p.color600 },
		NeogitHunkHeaderHighlight = { fg = p.primary, bg = p.color600 },
		NeogitDiffContext = { bg = p.color700 },
		NeogitDiffContextHighlight = { bg = p.color600 },
		NeogitDiffAdd = { fg = p.sage },
		NeogitDiffAddHighlight = { fg = p.sage, bg = p.color600 },
		NeogitDiffDelete = { fg = p.crimson },
		NeogitDiffDeleteHighlight = { fg = p.crimson, bg = p.color600 },
		NeogitNotificationInfo = { fg = p.tide },
		NeogitNotificationWarning = { fg = p.warning },
		NeogitNotificationError = { fg = p.error },
	}
end

return M
