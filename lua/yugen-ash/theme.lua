-- Theme generator with variant support

local M = {}

function M.get(config)
	local variant = config.variant or "main"
	local p = require("yugen-ash.palette").get(variant)
	local theme = {}
	local groups = config.groups or {}
	local styles = {
		italic = config.disable_italics and p.none or "italic",
		vert_split = config.bold_vert_split and groups.border or p.none,
		background = config.transparent and p.none or groups.background,
		float_background = config.transparent_statusline and p.none or groups.panel,
	}
	styles.nc_background = (config.dim_nc_background and not config.transparent and groups.panel) or styles.background

	-- UI
	theme.LineNr = { fg = p.color400 }
	theme.CursorLine = { bg = p.none, fg = p.rust }
	theme.CursorLineNr = { fg = p.crimson }
	theme.CursorColumn = { bg = p.color800 }
	theme.Cursor = { fg = p.color200, bg = p.placeholder }
	theme.ColorColumn = { bg = p.color600 }
	theme.Conceal = { fg = p.color200, bg = p.none }
	theme.DiffAdd = { bg = p.color700 }
	theme.DiffChange = { fg = p.color200, bg = p.color700 }
	theme.DiffDelete = { bg = p.color700 }
	theme.DiffText = { bg = p.color700 }
	theme.Directory = { fg = p.color300, bg = p.none }
	theme.ErrorMsg = { fg = p.error, style = "bold" }
	theme.FloatBorder = { fg = groups.border }
	theme.FloatTitle = { fg = p.color200 }
	theme.FoldColumn = { fg = p.color200 }
	theme.Folded = { fg = p.color200, bg = groups.panel }
	theme.IncSearch = { fg = p.color200, bg = p.color600 }
	theme.MatchParen = { fg = p.color200, bg = p.color700 }
	theme.ModeMsg = { fg = p.color200 }
	theme.MoreMsg = { fg = p.color200 }
	theme.NonText = { fg = p.color500 }
	theme.Normal = { fg = p.color300, bg = p.color700 }
	theme.NormalFloat = { fg = p.color200, bg = p.color700 }
	theme.NormalNC = { fg = p.color200, bg = p.color700 }
	theme.Pmenu = { fg = p.color200, bg = p.color700 }
	theme.PmenuSbar = { bg = p.color700 }
	theme.PmenuSel = { fg = p.color200, bg = p.color400 }
	theme.PmenuThumb = { bg = p.color600 }
	theme.Question = { fg = p.warning }
	theme.Search = { fg = p.color200, bg = p.color600 }
	theme.SignColumn = { fg = p.color200, bg = p.none }
	theme.SpecialKey = { fg = p.color200 }
	theme.SpellBad = { sp = p.error, style = "undercurl" }
	theme.SpellCap = { sp = p.color300, style = "undercurl" }
	theme.SpellLocal = { sp = p.warning, style = "undercurl" }
	theme.SpellRare = { sp = p.color300, style = "undercurl" }
	theme.StatusLine = { fg = p.color200, bg = styles.float_background }
	theme.StatusLineNC = { fg = p.color200, bg = styles.background }
	theme.TabLine = { fg = p.color200 }
	theme.TabLineFill = { bg = p.color800 }
	theme.TabLineSel = { fg = p.color200, bg = p.color800 }
	theme.Title = { fg = p.color200 }
	theme.VertSplit = { fg = groups.border }
	theme.Visual = { fg = p.color200, bg = p.color600 }
	theme.WarningMsg = { fg = p.warning }
	theme.Whitespace = { fg = p.color600 }
	theme.WildMenu = { link = "IncSearch" }

	-- Syntax
	theme.Constant = { fg = p.violet }
	theme.String = { fg = p.sage }
	theme.Character = { fg = p.sage }
	theme.Number = { fg = p.violet }
	theme.Boolean = { fg = p.tide }
	theme.Float = { fg = p.violet }
	theme.Identifier = { fg = p.color200 }
	theme.Function = { fg = p.primary }
	theme.Statement = { fg = p.color200 }
	theme.Conditional = { fg = p.tide }
	theme.Repeat = { fg = p.tide }
	theme.Label = { fg = p.seafoam }
	theme.Operator = { fg = p.frost }
	theme.Keyword = { fg = p.crimson }
	theme.Exception = { fg = p.tide }
	theme.PreProc = { fg = p.crimson }
	theme.Include = { fg = p.violet }
	theme.Type = { fg = p.gold }
	theme.Special = { fg = p.rust }
	theme.Tag = { fg = p.primary }
	theme.Delimiter = { fg = p.color200 }
	theme.SpecialComment = { fg = p.color300 }
	theme.Comment = { fg = p.color400 }
	theme.Underlined = { style = "underline" }
	theme.Bold = { style = "bold" }
	theme.Italic = { style = "italic" }

	-- Diagnostics
	theme.DiagnosticError = { fg = p.error }
	theme.DiagnosticWarn = { fg = p.warning }
	theme.DiagnosticInfo = { fg = p.tide }
	theme.DiagnosticHint = { fg = p.success }
	theme.DiagnosticUnderlineError = { sp = p.error, style = "undercurl" }
	theme.DiagnosticUnderlineWarn = { sp = p.warning, style = "undercurl" }
	theme.DiagnosticUnderlineInfo = { sp = p.tide, style = "undercurl" }
	theme.DiagnosticUnderlineHint = { sp = p.success, style = "undercurl" }
	theme.DiagnosticVirtualTextError = { fg = p.error }
	theme.DiagnosticVirtualTextWarn = { fg = p.warning }
	theme.DiagnosticVirtualTextInfo = { fg = p.tide }
	theme.DiagnosticVirtualTextHint = { fg = p.success }
	theme.DiagnosticSignError = { fg = p.error }
	theme.DiagnosticSignWarn = { fg = p.warning }
	theme.DiagnosticSignInfo = { fg = p.tide }
	theme.DiagnosticSignHint = { fg = p.success }
	theme.DiagnosticDeprecated = { fg = p.color500, style = "strikethrough" }
	theme.DiagnosticUnnecessary = { fg = p.color500, style = "italic" }
	theme.LspInlayHint = { fg = p.color400, style = "italic" }
	theme.LspInlayHintBackground = { bg = groups.panel }
	theme.LspInlayHintType = { fg = p.color400 }
	theme.LspInlayHintParameter = { fg = p.color300 }

	-- Legacy LSP diagnostics (compatibility)
	theme.LspDiagnosticsDefaultError = { fg = p.error }
	theme.LspDiagnosticsDefaultWarning = { fg = p.warning }
	theme.LspDiagnosticsDefaultInformation = { fg = p.tide }
	theme.LspDiagnosticsDefaultHint = { fg = p.success }
	theme.LspDiagnosticsUnderlineError = { sp = p.error, style = "undercurl" }
	theme.LspDiagnosticsUnderlineWarning = { sp = p.warning, style = "undercurl" }
	theme.LspDiagnosticsUnderlineInformation = { sp = p.tide, style = "undercurl" }
	theme.LspDiagnosticsUnderlineHint = { sp = p.success, style = "undercurl" }
	theme.LspDiagnosticsVirtualTextError = { fg = p.error }
	theme.LspDiagnosticsVirtualTextWarning = { fg = p.warning }
	theme.LspDiagnosticsVirtualTextInformation = { fg = p.tide }
	theme.LspDiagnosticsVirtualTextHint = { fg = p.success }
	theme.LspDiagnosticsSignError = { fg = p.error }
	theme.LspDiagnosticsSignWarning = { fg = p.warning }
	theme.LspDiagnosticsSignInformation = { fg = p.tide }
	theme.LspDiagnosticsSignHint = { fg = p.success }
	theme.LspDiagnosticsFloatingError = { fg = p.error, bg = groups.panel }
	theme.LspDiagnosticsFloatingWarning = { fg = p.warning, bg = groups.panel }
	theme.LspDiagnosticsFloatingInformation = { fg = p.tide, bg = groups.panel }
	theme.LspDiagnosticsFloatingHint = { fg = p.success, bg = groups.panel }

	-- C specific syntax groups (matching .c and .h files)
	theme.cTypedef = { fg = p.crimson }
	theme.cPreCondit = { fg = p.crimson }
	theme.cStructure = { fg = p.crimson }
	theme.cType = { fg = p.gold }
	theme.cStorageClass = { fg = p.crimson }
	theme.cInclude = { fg = p.violet }
	theme.cDefine = { fg = p.crimson }
	theme.cMacro = { fg = p.violet }
	theme.cSpecial = { fg = p.coral }
	theme.cCommentString = { fg = p.sage }
	theme.cCommentSkip = { fg = p.color400 }
	theme.cComment2 = { fg = p.color400 }
	theme.cConstant = { fg = p.violet }
	theme.cInteger = { fg = p.violet }
	theme.cFloat = { fg = p.violet }
	theme.cString = { fg = p.sage }
	theme.cCharacter = { fg = p.sage }
	theme.cOperator = { fg = p.tide }
	theme.cLabel = { fg = p.seafoam }
	theme.cConditional = { fg = p.tide }
	theme.cRepeat = { fg = p.tide }
	theme.cStatement = { fg = p.color200 }
	theme.cException = { fg = p.tide }
	theme.cSpecialChar = { fg = p.gold }
	theme.cSpecialComment = { fg = p.color400 }

	-- Treesitter
	theme["@variable"] = { fg = p.color200 }
	theme["@property"] = { fg = p.color300 }
	theme["@variable.builtin"] = { fg = p.color300 }
	theme["@variable.parameter"] = { fg = p.color200, style = styles.italic }
	theme["@variable.member"] = { fg = p.color500 }
	theme["@variable.object.property"] = { fg = p.color500 }
	theme["@constant"] = { link = "Constant" }
	theme["@constant.builtin"] = { fg = p.violet }
	theme["@constant.macro"] = { fg = p.violet, style = "bold" }
	theme["@function"] = { link = "Function" }
	theme["@function.call"] = { link = "Function" }
	theme["@function.builtin"] = { fg = p.crimson }
	theme["@function.macro"] = { fg = p.violet, style = "bold" }
	theme["@keyword"] = { link = "Keyword" }
	theme["@keyword.function"] = { fg = p.crimson }
	theme["@keyword.import"] = { fg = p.violet }
	theme["@keyword.operator"] = { link = "Operator" }
	theme["@keyword.return"] = { link = "Keyword" }
	theme["@keyword.coroutine"] = { fg = p.tide }
	theme["@keyword.export"] = { fg = p.crimson }
	theme["@parameter"] = { fg = p.color200 }
	theme["@method"] = { fg = p.gold }
	theme["@operator"] = { fg = p.tide }
	theme["@punctuation.delimiter"] = { fg = p.color400 }
	theme["@punctuation.bracket"] = { fg = p.color400 }
	theme["@string"] = { link = "String" }
	theme["@string.documentation"] = { fg = p.color400 }
	theme["@string.regexp"] = { fg = p.coral }
	theme["@string.escape"] = { fg = p.gold }
	theme["@tag"] = { fg = p.sage }
	theme["@tag.attribute"] = { fg = p.gold, style = styles.italic }
	theme["@text"] = { fg = p.color200 }
	theme["@text.title"] = { fg = p.primary, style = "bold" }
	theme["@type"] = { fg = p.gold }
	theme["@type.builtin"] = { fg = p.amber }
	theme["@type.qualifier"] = { fg = p.crimson }
	theme["@type.definition"] = { fg = p.crimson }
	theme["@label"] = { fg = p.seafoam }
	theme["@conditional"] = { fg = p.tide }
	theme["@repeat"] = { fg = p.tide }
	theme["@storageclass"] = { fg = p.crimson }
	theme["@structure"] = { fg = p.crimson }
	theme["@include"] = { fg = p.violet }
	theme["@exception"] = { fg = p.tide }
	theme["@comment"] = { fg = p.color400 }
	theme["@comment.error"] = { fg = p.error }
	theme["@comment.warning"] = { fg = p.warning }
	theme["@comment.hint"] = { fg = p.success }
	theme["@comment.todo"] = { fg = p.gold, style = "bold" }

	-- C Treesitter
	theme["@type.c"] = { fg = p.gold }
	theme["@type.builtin.c"] = { fg = p.gold }
	theme["@keyword.c"] = { fg = p.tide }
	theme["@keyword.storage.c"] = { fg = p.crimson }
	theme["@keyword.function.c"] = { fg = p.crimson }
	theme["@preproc.c"] = { fg = p.crimson }
	theme["@preproc.define.c"] = { fg = p.violet, style = "bold" }
	theme["@preproc.include.c"] = { fg = p.violet }
	theme["@constant.c"] = { fg = p.violet }
	theme["@macro.c"] = { fg = p.violet, style = "bold" }
	theme["@structure.c"] = { fg = p.crimson }
	theme["@union.c"] = { fg = p.crimson }
	theme["@enum.c"] = { fg = p.crimson }

	-- LSP
	theme.LspReferenceText = { bg = p.color800 }
	theme.LspReferenceRead = { bg = p.color400 }
	theme.LspReferenceWrite = { bg = p.color800 }
	theme.LspCodeLens = { fg = p.color400 }
	theme.LspSignatureActiveParameter = { bg = p.placeholder, style = "bold" }
	theme.lspTypeProperty = { fg = p.color500 }
	theme.lspTypeParameter = { fg = p.color500, style = styles.italic }
	theme.lspTypeVariable = { fg = p.color500 }

	-- Git signs
	theme.GitSignsAdd = { fg = groups.git_add }
	theme.GitSignsChange = { fg = groups.git_change }
	theme.GitSignsDelete = { fg = groups.git_delete }
	theme.GitSignsCurrentLineBlame = { fg = p.color400 }

	-- NvimTree
	theme.NvimTreeFolderIcon = { fg = p.crimson }
	theme.NvimTreeFolderName = { fg = p.color300 }
	theme.NvimTreeNormal = { fg = p.color200 }
	theme.NvimTreeRootFolder = { fg = p.color100, style = "bold" }
	theme.NvimTreeGitNew = { fg = p.sage }
	theme.NvimTreeGitDirty = { fg = p.color200 }
	theme.NvimTreeGitStaged = { fg = p.seafoam }
	theme.WinSeparator = { fg = p.color600, bg = p.color700 }

	-- Markdown
	theme.markdownHeadingDelimiter = { fg = p.primary, style = "bold" }
	theme.markdownHeadingRule = { fg = p.color400 }
	theme.markdownHeadingTitle = { fg = p.primary, style = "bold" }
	theme.markdownH1 = { fg = p.primary, style = "bold" }
	theme.markdownH2 = { fg = p.coral, style = "bold" }
	theme.markdownH3 = { fg = p.gold, style = "bold" }
	theme.markdownH4 = { fg = p.crimson, style = "bold" }
	theme.markdownH5 = { fg = p.violet, style = "bold" }
	theme.markdownH6 = { fg = p.tide, style = "bold" }
	theme.markdownBold = { style = "bold" }
	theme.markdownItalic = { style = "italic" }
	theme.markdownBoldItalic = { style = "bold,italic" }
	theme.markdownCode = { fg = p.sage }
	theme.markdownCodeBlock = { fg = p.sage }
	theme.markdownCodeDelimiter = { fg = p.color400 }
	theme.markdownUrl = { fg = p.tide, style = "underline" }
	theme.markdownLinkText = { fg = p.primary }
	theme.markdownLinkDelimiter = { fg = p.color400 }
	theme.markdownUrlTitle = { fg = p.sage }
	theme.markdownUrlTitleDelimiter = { fg = p.color400 }
	theme.markdownListMarker = { fg = p.primary }
	theme.markdownOrderedListMarker = { fg = p.primary }
	theme.markdownRule = { fg = p.color400 }
	theme.markdownBlockquote = { fg = p.color400 }
	theme.markdownH1Delimiter = { fg = p.color400 }
	theme.markdownH2Delimiter = { fg = p.color400 }
	theme.markdownH3Delimiter = { fg = p.color400 }
	theme.markdownH4Delimiter = { fg = p.color400 }
	theme.markdownH5Delimiter = { fg = p.color400 }
	theme.markdownH6Delimiter = { fg = p.color400 }

	-- Treesitter markdown
	theme["@markup.heading"] = { fg = p.primary, style = "bold" }
	theme["@markup.heading.1.markdown"] = { fg = p.primary, style = "bold" }
	theme["@markup.heading.2.markdown"] = { fg = p.coral, style = "bold" }
	theme["@markup.heading.3.markdown"] = { fg = p.gold, style = "bold" }
	theme["@markup.heading.4.markdown"] = { fg = p.crimson, style = "bold" }
	theme["@markup.heading.5.markdown"] = { fg = p.violet, style = "bold" }
	theme["@markup.heading.6.markdown"] = { fg = p.tide, style = "bold" }
	theme["@markup.bold"] = { style = "bold" }
	theme["@markup.italic"] = { style = "italic" }
	theme["@markup.strikethrough"] = { style = "strikethrough" }
	theme["@markup.underline"] = { style = "underline" }
	theme["@markup.link"] = { fg = p.primary }
	theme["@markup.link.label"] = { fg = p.primary }
	theme["@markup.link.url"] = { fg = p.tide, style = "underline" }
	theme["@markup.raw"] = { fg = p.sage }
	theme["@markup.raw.block"] = { fg = p.sage }
	theme["@markup.list"] = { fg = p.primary }
	theme["@markup.list.unchecked"] = { fg = p.color400 }
	theme["@markup.list.checked"] = { fg = p.success }
	theme["@punctuation.special.markdown"] = { fg = p.color400 }

	-- Cmp
	theme.CmpItemAbbr = { fg = p.color200 }
	theme.CmpItemAbbrMatch = { fg = p.color300, style = "bold" }
	theme.CmpItemKind = { fg = p.primary }
	theme.CmpItemMenu = { fg = p.color400 }

	-- Telescope
	theme.TelescopeNormal = { fg = p.color200, bg = p.color700 }
	theme.TelescopeSelection = { fg = p.color200, bg = p.color600 }
	theme.TelescopeBorder = { fg = p.color400, bg = p.color700 }
	theme.TelescopePromptNormal = { fg = p.color200, bg = p.color700 }
	theme.TelescopePromptBorder = { fg = p.color400, bg = p.color700 }
	theme.TelescopePromptTitle = { fg = p.color100, bg = p.color700 }
	theme.TelescopePreviewTitle = { fg = p.color100, bg = p.color700 }
	theme.TelescopeResultsTitle = { fg = p.color100, bg = p.color700 }
	theme.TelescopeMatching = { fg = p.primary }
	theme.TelescopeSelectionCaret = { fg = p.primary }
	theme.TelescopePromptPrefix = { fg = p.primary }

	-- Noice
	theme.NoiceCmdlineIcon = { fg = p.primary }
	theme.NoiceCmdlineIconSearch = { fg = p.crimson }
	theme.NoiceCmdlineIconFilter = { fg = p.crimson }
	theme.NoiceCmdlineIconLua = { fg = p.tide }
	theme.NoiceCmdlinePopup = { fg = p.color200, bg = p.color700 }
	theme.NoiceCmdlinePopupBorder = { fg = p.primary }
	theme.NoiceCmdlinePopupBorderSearch = { fg = p.crimson, bg = p.color700 }
	theme.NoiceCmdlinePopupTitle = { fg = p.color100, bg = p.color700 }
	theme.NoiceCmdlinePopupBorderFilter = { fg = p.crimson, bg = p.color700 }
	theme.NoiceCmdlinePopupBorderLua = { fg = p.tide, bg = p.color700 }
	theme.NoiceCmdlinePopupTitleSearch = { fg = p.crimson, bg = p.color700 }
	theme.NoiceCmdlinePopupTitleFilter = { fg = p.crimson, bg = p.color700 }
	theme.NoiceCmdlinePopupTitleLua = { fg = p.crimson, bg = p.color700 }
	theme.NoiceFormatProgressDone = { fg = p.primary, bg = p.color700 }
	theme.NoiceFormatProgressTodo = { fg = p.color400, bg = p.color700 }
	theme.NoiceLspProgressClient = { fg = p.color200 }
	theme.NoiceLspProgressPlugin = { fg = p.color400 }
	theme.NoiceLspProgressTitle = { fg = p.primary }

	-- Terminal
	vim.g.terminal_color_0 = p.color800
	vim.g.terminal_color_1 = p.primary
	vim.g.terminal_color_2 = p.success
	vim.g.terminal_color_3 = p.warning
	vim.g.terminal_color_4 = p.violet
	vim.g.terminal_color_5 = p.crimson
	vim.g.terminal_color_6 = p.tide
	vim.g.terminal_color_7 = p.color100
	vim.g.terminal_color_8 = p.color300
	vim.g.terminal_color_9 = p.error
	vim.g.terminal_color_10 = p.success
	vim.g.terminal_color_11 = p.warning
	vim.g.terminal_color_12 = p.primary
	vim.g.terminal_color_13 = p.coral
	vim.g.terminal_color_14 = p.tide
	vim.g.terminal_color_15 = p.color100

	return theme
end

return M
