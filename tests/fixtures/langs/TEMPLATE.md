# Adding a language fixture

1. Create `tests/fixtures/langs/<parser-id>.<ext>`. Use the parser/filetype id
   from `lua/yugen-ash/groups/langs/` (`c_sharp`, `json`, `dockerfile`, ...).
2. Start the file with a comment header describing how to open and debug it.
   For formats without comments (JSON), put the header in a sibling
   `README.md` and keep the fixture data-only.
3. Add the fixture to `tests/manifest.lua`.
4. Run `scripts/test-highlights.sh <lang>` and add constructs until the
   `missing` list is empty.
5. Document only genuinely unreachable groups in `tests/expected/<lang>.lua`.
6. Run `scripts/check.sh`.

## Header template

```text
# yugen-ash highlight showcase — <Language> (<ext>)
#
# Purpose: exercise every reachable group from groups/langs/<lang>.lua plus
# the common base captures (comments, numbers, strings, keywords, functions, ...).
#
# Open with the theme:
#   nvim -u tests/minimal_init.lua tests/fixtures/langs/<file>
#   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/<file>
#
# Debug at the cursor:
#   :Inspect
#   :InspectTree
#   :YugenAshInspect
#   :YugenAshInspect <group>
#   :YugenAshInspect!
#   :hi <group>
#   :verbose hi <group>
#   :lua =vim.inspect_pos()
#   :lua =vim.treesitter.get_captures_at_pos(0, row, col)
#   :YugenAshCompile
#
# Headless coverage check:
#   scripts/test-highlights.sh <lang>
#
# Sections are annotated with the groups they are meant to exercise.
```

## File order

1. Legacy vimscript syntax groups.
2. Language-specific Treesitter captures.
3. A compact common-base section (comment, number, string, boolean, keyword,
   function, operator, punctuation, variable, type, constant).
4. Language-specific `@lsp.*` links do not need fixture constructs; they are
   checked statically by `scripts/check.sh`.

Annotate sections with comments, for example:

```text
# --- legacy syntax: rubyModule, rubyClass, rubyDefine ---
# --- Treesitter: @keyword, @function.call, @type ---
```

## Manifest entry

```lua
<lang> = {
	file = "<file>",
	filetype = "<filetype>",
	parser = "<parser-id>",
	syntax = "<legacy-syntax-name>",
	module = "<module-basename>",
	vim_g = {
		-- optional globals needed by the legacy syntax file
	},
	common = {
		"@comment",
		"@number",
		"@string",
		"@boolean",
		"@keyword",
		"@function",
		"@operator",
		"@punctuation.delimiter",
		"@punctuation.bracket",
		"@constant",
		"@type",
		"@variable",
		"@variable.member",
		"@variable.parameter",
		"Number",
		"String",
		"Boolean",
		"Keyword",
		"Function",
	},
},
```

Adjust `common` to the constructs the language actually has. For example, a
data-only format has no functions or keywords.

## Allowlist entry

```lua
return {
	unreachable = {
		SomeGroup = "not emitted by bundled $VIMRUNTIME/syntax/<lang>.vim",
		["@some.capture.<lang>"] = "not emitted by the installed Treesitter highlight query",
	},
}
```

Each reason must name the source that was checked. Do not add a group here if
the fixture can demonstrate it.
