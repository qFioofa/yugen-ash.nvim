-- mfussenegger/nvim-dap (signs) + rcarriga/nvim-dap-ui

local M = {}

function M.get(p, groups, styles)
	return {
		-- nvim-dap signs
		DapBreakpoint = { fg = p.error },
		DapBreakpointCondition = { fg = p.warning },
		DapBreakpointRejected = { fg = p.color400 },
		DapLogPoint = { fg = p.tide },
		DapStopped = { fg = p.sage },
		DapStoppedLine = { bg = p.color600 },

		-- nvim-dap-ui
		DapUIScope = { fg = p.tide },
		DapUIType = { fg = p.violet },
		DapUIValue = { fg = p.color200 },
		DapUIVariable = { fg = p.color200 },
		DapUIModifiedValue = { fg = p.primary, style = "bold" },
		DapUIDecoration = { fg = p.tide },
		DapUIThread = { fg = p.sage },
		DapUIStoppedThread = { fg = p.tide },
		DapUISource = { fg = p.violet },
		DapUILineNumber = { fg = p.tide },
		DapUIFloatBorder = { fg = groups.border },
		DapUIWatchesEmpty = { fg = p.crimson },
		DapUIWatchesValue = { fg = p.sage },
		DapUIWatchesError = { fg = p.error },
		DapUIBreakpointsPath = { fg = p.tide },
		DapUIBreakpointsInfo = { fg = p.sage },
		DapUIBreakpointsCurrentLine = { fg = p.sage, style = "bold" },
		DapUIBreakpointsLine = { link = "DapUILineNumber" },
		DapUIBreakpointsDisabledLine = { fg = p.color400 },
		DapUICurrentFrameName = { fg = p.sage, style = "bold" },
		DapUIStepOver = { fg = p.tide },
		DapUIStepInto = { fg = p.tide },
		DapUIStepBack = { fg = p.tide },
		DapUIStepOut = { fg = p.tide },
		DapUIStop = { fg = p.crimson },
		DapUIPlayPause = { fg = p.sage },
		DapUIRestart = { fg = p.sage },
		DapUIUnavailable = { fg = p.color400 },
	}
end

return M
