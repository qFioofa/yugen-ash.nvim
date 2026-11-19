# AGENTS.md

Instructions for agents working on `yugen-ash.nvim`, a role-based Neovim
colorscheme.

The short version:

- Colors are semantic roles, not per-language choices.
- Group modules never contain raw hex.
- Every module is registered manually in `lua/yugen-ash/theme.lua`.
- Chrome uses the configurable `groups.*` tokens.
- `link` is allowed for LSP tokens and pure aliases; everything else uses an
  explicit palette role.
- Verify the group name and the real on-screen color with Neovim APIs before
  changing anything.

---

## 1. Project structure

```text
colors/yugen-ash.lua          # colorscheme entrypoint
lua/yugen-ash/init.lua        # setup/config/commands, colorscheme()
lua/yugen-ash/theme.lua       # module registry, style resolution, aggregation
lua/yugen-ash/palette.lua     # five variants; identical keys in every variant
lua/yugen-ash/utils.lua       # to_hl(), highlight(), blend()
lua/yugen-ash/cache.lua       # compiled-theme cache, mtime invalidation
lua/yugen-ash/inspect.lua     # read-only group/color inspector (diagnostic)
lua/yugen-ash/groups/         # base groups
  ui.lua
  syntax.lua
  diagnostics.lua
  treesitter.lua
  lsp.lua
  markdown.lua
  terminal.lua
  langs/<parser-id>.lua       # one file per language
  plugins/<plugin>.lua        # one file per plugin
lua/lualine/themes/           # integrations that need their own theme table
lua/barbecue/theme/
tests/
  manifest.lua                # language fixture -> filetype/parser/syntax
  run.lua                     # headless highlight coverage check
  minimal_init.lua            # open a fixture with the theme for manual checks
  expected/<lang>.lua         # documented unreachable groups
  fixtures/langs/<lang>.<ext> # language highlight showcases
scripts/                      # deploy, inspect, check, test-highlights
```

### Module contract

Every group module exposes exactly one function:

```lua
local M = {}

function M.get(p, groups, styles)
	return {
		SomeGroup = { fg = p.coral, bg = styles.panel, style = styles.italic },
		AliasGroup = { link = "SomeGroup" },
	}
end

return M
```

- `p` is the resolved palette for the active variant.
- `groups` is the resolved `setup.groups` table (border, panel, comment, ...).
- `styles` is the resolved style table (see theme.lua).
- Values are only `p.<role>`, `groups.<token>`, `styles.<style>`, `"none"`,
  or `link = "<group>"`.
- A module never imports another group module and never mutates globals.

### Registration

Modules are registered manually in `lua/yugen-ash/theme.lua`:

```lua
local modules = {
	"yugen-ash.groups.ui",
	-- ...
	"yugen-ash.groups.langs.python",
	-- ...
	"yugen-ash.groups.plugins.telescope",
	-- ...
}
```

- Keep the grouping: base → langs → plugins.
- One file = one module = one plugin or one language.
- `scripts/check.sh` fails when a file under `groups/langs/` or
  `groups/plugins/` is not registered.

### File naming

- Language files use the Neovim parser/filetype id: `c_sharp`, `json`,
  `bash`, `dockerfile`.
- Plugin files use the repository name: `which-key`, `blink-cmp`,
  `nvimtree`, `render-markdown`.
- Header comment: `-- owner/repo` for plugins,
  `-- <Language> (<ext>) — vimscript syntax + Treesitter` for languages.

### Ownership

- Base groups (`Normal`, `Comment`, `@function`, `DiagnosticError`, ...) belong
  to the base modules under `groups/` and to `syntax.lua`, `treesitter.lua`,
  `ui.lua`, `lsp.lua`, `markdown.lua`, `diagnostics.lua`.
- Plugin modules must not redefine base groups. If a plugin group aliases a
  base group, use `link`.
- A plugin integration that is not a highlight group (lualine, barbecue) lives
  under `lua/lualine/themes/` or `lua/barbecue/theme/`, not in `groups/`.

### Cache

`cache.lua` keys the compiled theme by the resolved config and invalidates it
from the newest mtime of any `**/*.lua` under the theme. Editing sources or
adding a module rebuilds automatically. Use `:YugenAshCompile` to force a
rebuild, `:YugenAshClean` to drop the cache.

---

## 2. Adding a highlight group

### 2.1 Plugin checklist

1. Verify the exact group names in the plugin source (`lua/`, `plugin/`,
   `doc/`, README, `queries/`). Do not guess from a screenshot.
2. Create `lua/yugen-ash/groups/plugins/<repo>.lua` with the plugin header.
3. Implement `M.get(p, groups, styles)` using semantic roles.
4. Chrome:
   - float/menu/picker background → `styles.panel`
   - border/separator → `groups.border`
   - editor background → `styles.background`
   - statusline/bar → `styles.statusline`
5. States:
   - diagnostics → `groups.error`, `groups.warn`, `groups.info`, `groups.hint`
   - git → `groups.git_*`
   - diff → the same git roles
   - selection/cursorline → `p.color600`
   - muted/inactive → `p.color400` / `p.color500`
6. Use `link` only for LSP tokens and pure aliases (section 4).
7. Register the module in `theme.lua`.
8. If a new reusable semantic role was introduced, update this file and the
   README role table.
9. Run `scripts/check.sh` and `:YugenAshCompile`.

### 2.2 Language checklist

1. Create `groups/langs/<parser-id>.lua` with the language header.
2. Order inside the file:
   - legacy vimscript groups;
   - Treesitter captures;
   - language-specific `@lsp.*` links, only when they differ from the generic
     mapping.
3. Map each group onto the canonical role table (section 3).
4. Do not duplicate generic groups unless the language needs a different role.
5. Register the module in `theme.lua`, run the checks, inspect the result.
6. Add `tests/fixtures/langs/<parser-id>.<ext>`, an entry in
   `tests/manifest.lua`, and run `scripts/test-highlights.sh <lang>`. Document
   only genuinely unreachable groups in `tests/expected/<lang>.lua`; see
   `tests/fixtures/langs/TEMPLATE.md`.

### 2.3 Adding a palette role

- Add the key to **all five variants** (`main`, `rich`, `muted`, `vibrant`,
  `light`) with the same semantic intent.
- Add a default to `setup.groups` only if the role must be user-configurable.
- A missing key resolves to `nil` and silently removes the color in that
  variant. Never add a role to one variant only.
- Prefer an existing role. A new color for a single group is a design smell.

### 2.4 Anti-patterns

- Raw hex in a group module.
- A new palette key in one variant.
- Literal `style = "italic"` (bypasses `disable_italics`).
- Redefining a base group from a plugin module.
- Linking to an optional group or to a foreign plugin's group.
- Leaving a file unregistered in `theme.lua`.
- Adding a group for a plugin that is not supported or tested.

---

## 3. Color rules

### 3.1 Palette and style tokens

Palette keys are stable across variants. The role table below is the same for
every variant; only the hex values change.

Live `setup.groups` tokens:

| Token | Default | Use |
|---|---|---|
| `background` | `color700` | editor background |
| `panel` | `color700` | floats, menus, pickers |
| `statusline` | `color800` | statusline, tabline, bars |
| `border` | `color600` | borders and separators |
| `comment` | `color400` | comments and docs |
| `punctuation` | `color400` | delimiters and brackets |
| `link` | `primary` | link labels/text |
| `error` / `warn` / `info` / `hint` | `error` / `warning` / `tide` / `success` | diagnostics |
| `git_add` / `git_change` / `git_delete` | `sage` / `warning` / `crimson` | git state |
| `git_dirty` / `git_ignore` | `color200` / `color500` | git state |
| `git_merge` / `git_rename` / `git_stage` / `git_text` | `tide` / `coral` / `seafoam` / `color200` | git state |
| `headings.h1..h6` | `primary` / `coral` / `gold` / `crimson` / `violet` / `tide` | markdown headings |

Resolved style tokens in `theme.lua`:

| Style | Meaning |
|---|---|
| `styles.italic` | `italic` unless `disable_italics` |
| `styles.bold` | `bold` |
| `styles.background` | `groups.background`, or `none` when transparent |
| `styles.panel` | `groups.panel`, or `none` when transparent |
| `styles.statusline` | `groups.statusline`, or `none` when transparent or `transparent_statusline` |
| `styles.nc_background` | dimmed inactive background when `dim_nc_background` |
| `styles.vert_split` | bold split color when `bold_vert_split` |

### 3.2 Canonical role table

| Concept | Role |
|---|---|
| Keywords, declarations, storage/modifiers, structures, preprocessor | `crimson` |
| Imports/includes | `crimson` (keyword family, never violet) |
| Control flow (conditional, repeat, case, exception) | `tide` |
| Operators | `frost` |
| Functions (name, call, builtin, method, macro) | `primary` |
| Types, classes, structs, enums, interfaces, modules, namespaces | `gold` |
| `@type.definition` | `gold` |
| Builtin types | `amber` |
| Numbers and floats | `violet` |
| Booleans | `tide` |
| Constants (all constant groups) | `tide` |
| `@constant.macro` | `tide` + bold |
| Builtin constants | `tide` |
| Strings and characters | `sage` |
| Comments and documentation | `groups.comment` |
| Variables | `color200` |
| Parameters | `color200` + `styles.italic` |
| Properties, members, fields | `color300` |
| Labels, atoms, symbols | `seafoam` |
| Escape sequences and special characters | `rust` |
| Interpolation, regexp, special punctuation | `coral` |
| Attributes, decorators, annotations | `amber` + `styles.italic` |
| `null` / `nil` / `None` | `violet` |
| Markdown headings | `groups.headings.h1..h6` + bold |

Documented exceptions:

- CSS selector attributes (`@attribute.css`, `@tag.attribute.css`,
  `@property.id.css`, `@property.class.css`) use `gold` because they select,
  not decorate.
- `@string.special.symbol` is `seafoam`; `@string.special.path` is `sage`;
  `@string.special.uri` is `seafoam` + underline; `@string.special.regexp`
  and other special string content is `coral`.
- Ruby symbols follow the symbol rule (`seafoam`); the old `rust` value is
  legacy debt.
- Elixir `@variable.member` uses `seafoam` because atom/map keys are
  symbol-like.
- `@variable.builtin` is `violet`; `@constant.builtin` is `tide`;
  `@function.builtin` is `primary`; `@type.builtin` is `amber`.

### 3.3 UI rules

| Component | Token |
|---|---|
| Editor background | `styles.background` |
| Float/menu/picker background | `styles.panel` |
| Statusline/tabline/bar background | `styles.statusline` |
| Borders and separators | `groups.border` |
| Primary text | `p.color200` |
| Secondary text | `p.color300` |
| Muted/inactive text | `p.color400` / `p.color500` |
| Selection, cursorline, search | `p.color600` |
| Accent, prompts, matches | `p.primary` |
| Errors | `groups.error` |
| Warnings | `groups.warn` |
| Info | `groups.info` |
| Hints | `groups.hint` |
| Diff add/change/delete | `groups.git_add` / `groups.git_change` / `groups.git_delete` |

- Floating windows: `NormalFloat` uses `styles.panel`, `FloatBorder` uses
  `groups.border`.
- Popup menu: `Pmenu` uses `styles.panel`; `PmenuSel` uses `p.color600`.
- Statusline: `StatusLine` uses `styles.statusline`; `StatusLineNC` uses
  `styles.background`.
- Tabline: `TabLineFill` uses `styles.statusline`; `TabLineSel` uses
  `p.color600` when a distinct selected state is needed.
- Lualine/barbecue mode colors follow the same roles: normal `crimson`,
  insert `success`, visual `warning`, replace `error`, command `amber`,
  terminal `seafoam`.

### 3.4 Style rules

- Use `styles.italic`, never the literal `"italic"`.
- Use `styles.bold` for bold. Literal `"bold"` is acceptable only when bold is
  semantically required and never disabled by config; prefer the token.
- `disable_italics` must affect every italic group.
- `link` supersedes `fg`/`bg`/`style`; never combine them expecting both.
- `blend` and `transparent` make the final color context-dependent; verify on
  screen and do not report a single hex as the whole truth.

### 3.5 Ambiguity and conflict resolution

When no rule covers a group, apply this order:

1. Is there a canonical role for the concept? Use it.
2. Is the group a pure alias of an existing group? Use `link` (section 4).
3. Is it chrome/text? Use `background`/`panel`/`statusline`/`border` or the
   neutral text scale `color200` → `color500`.
4. Is it a state/severity? Use `primary` or the diagnostic tokens.
5. Several roles fit: choose the more specific one and document why.
6. Still ambiguous: choose the nearest existing role. Do not invent a color
   for one group.
7. A reusable new role requires a palette key in all five variants and an
   update to this table.
8. Consistency across languages wins over local aesthetics; readability wins
   over subtlety.
9. If two rules conflict, the more specific rule wins; record the exception.

### 3.6 Git and diff

- add = `groups.git_add` (`sage`)
- change = `groups.git_change` (`warning`)
- delete = `groups.git_delete` (`crimson`)
- dirty = `groups.git_dirty` (`color200`)
- ignored = `groups.git_ignore` (`color500`)
- merge = `groups.git_merge` (`tide`)
- renamed = `groups.git_rename` (`coral`)
- staged = `groups.git_stage` (`seafoam`)
- text = `groups.git_text` (`color200`)
- diff uses the same add/change/delete roles; backgrounds stay on
  `p.color700` or `styles.panel`.

---

## 4. Links

### 4.1 Allowed

- LSP semantic tokens:
  - `@lsp.type.<type>` → the matching `@<type>` capture;
  - `@lsp.typemod.<type>.<mod>` → the matching capture when the modifier only
    refines semantics;
  - language-specific `@lsp.*.<lang>` only when the server emits a token that
    differs from the generic mapping.
- Pure aliases:
  - Treesitter → base syntax: `@function` → `Function`, `@keyword` →
    `Keyword`, `@string` → `String`, `@operator` → `Operator`.
  - UI aliases: `WildMenu` → `IncSearch`.
  - Plugin aliases: `IlluminatedWordText` → `LspReferenceText`,
    `IlluminatedWordRead` → `LspReferenceRead`, `IlluminatedWordWrite` →
    `LspReferenceWrite`, `DapUIBreakpointsLine` → `DapUILineNumber`,
    `FlashCursor` → `Cursor`, `DiffviewNormal` → `Normal`,
    `RenderMarkdownTableFill` → `Conceal`.

### 4.2 Forbidden

- `link` for a group with an independent semantic role. Use an explicit
  palette role.
- Links to foreign plugin groups, optional groups, or groups that may not
  exist.
- Cycles and self-links.
- Combining `link` with `fg`/`bg`/`style`: `utils.to_hl` returns only
  `{ link = ... }` in that case.

### 4.3 Targets and ownership

- A link target must be owned by this theme (`syntax`, `treesitter`, `ui`,
  `lsp`, `markdown`, `diagnostics`) or by the same plugin module.
- Base groups are owned by base modules; plugin modules must not redefine
  them.
- An alias lives in the module that owns the alias, not in the target module.
- Prefer `link` for aliases because it inherits future changes and is
  variant-agnostic. Use explicit palette roles for independent semantics.

### 4.4 LSP conventions

- The generic `lsp.lua` maps `@lsp.type.*` and common `@lsp.typemod.*` to the
  matching Treesitter captures.
- Add a language-specific LSP link only when the token genuinely differs in
  that language.
- Never invent `@lsp.<custom>` names; use the standard
  `@lsp.type/mod/typemod` forms.

---

## 5. Finding groups & effective colors

This section describes how to answer “what exactly is the user pointing at?”
and “what color is actually on screen?” without guessing.

### 5.1 User report intake

When a user says “this color is wrong”, collect:

- the exact token/symbol, filetype/language, and plugin;
- `:Inspect` at the position (or `:lua =vim.inspect_pos()`);
- `:InspectTree` for Treesitter;
- `:hi <group>`, `:hi link <group>`, and `:verbose hi <group>`;
- the active variant and `setup` options (`transparent`,
  `transparent_statusline`, `disable_italics`, `highlight_groups`);
- the context: normal buffer, float, statusline, tabline, winbar, cmdline,
  popup menu, sign, statuscolumn.

Determine what kind of entity it is:

- a real highlight group;
- a link alias;
- an extmark with `hl_group`;
- an integration theme table (lualine/barbecue) that is not a highlight group;
- a statusline segment (`%#Group#`).

If the user names a group but `:Inspect` shows another one, `:Inspect` wins.

Common phrasings:

| User says | Look at |
|---|---|
| “comment” | `@comment.lang`, `Comment` |
| “constant” | `@constant*`, `Constant`, LSP `@lsp.type.*` |
| “function” | `@function*`, `Function`, `@lsp.type.function` |
| “type” | `@type*`, `@lsp.type.type/class/struct` |
| “string” | `@string*`, `@lsp.type.string` |
| “statusline” | `StatusLine*`, `lua/lualine/themes/yugen-ash.lua` |
| “completion icon” | `BlinkCmpKind*`, `CmpItemKind*` |

### 5.2 Source hierarchy

1. Live Neovim:
   - `:Inspect`, `vim.inspect_pos`;
   - `:InspectTree`, `vim.treesitter.get_captures_at_pos`;
   - `vim.lsp.semantic_tokens.get_at_pos`;
   - `vim.fn.synstack`, `synID`, `synIDtrans`, `synIDattr`;
   - `:hi`, `:verbose hi`, `nvim_get_hl`.
2. Neovim documentation and runtime source:
   - `:help treesitter-highlight-groups`;
   - `:help lsp-semantic-highlight`;
   - `$VIMRUNTIME/lua/vim/treesitter/highlighter.lua`;
   - `$VIMRUNTIME/lua/vim/lsp/semantic_tokens.lua`.
3. Plugin source:
   - `lua/`, `plugin/`, `doc/`, README, `queries/highlights.scm`;
   - pin the version/tag/commit; group names can change between releases.
4. Existing theme:
   - `rg '<Group>' lua/yugen-ash/groups`; use the existing owner.
5. Last resort:
   - `getcompletion('', 'highlight')`, `:hi` on a live instance.

A group name is confirmed by at least two independent sources. A screenshot is
not a source of a group name.

### 5.3 Neovim 0.9+ compatibility

Use feature detection rather than assuming the newest API:

| API | 0.9 | Fallback |
|---|---|---|
| `vim.inspect_pos` | yes | `:Inspect` + `synstack` + `nvim_buf_get_extmarks` |
| `nvim_get_hl` | yes | `:hi` / `synIDtrans`; guard `create=false` with `pcall` |
| `vim.hl.priorities` | may be absent | constants below |
| `vim.lsp.semantic_tokens.get_at_pos` | may be absent | extmarks in `nvim.lsp.semantic_tokens` |
| `vim.treesitter.get_captures_at_pos` | yes | `:Inspect` / query API |
| `filter.extmarks = "all"` | may be absent | `extmarks = true` |

```lua
local priorities = (vim.hl and vim.hl.priorities) or {
	syntax = 50,
	treesitter = 100,
	semantic_tokens = 125,
	diagnostics = 150,
	user = 200,
}
```

### 5.4 Group at a buffer position

```lua
local buf = vim.api.nvim_get_current_buf()
local pos = vim.api.nvim_win_get_cursor(0)
local row, col = pos[1] - 1, pos[2]
local items = vim.inspect_pos(buf, row, col)
```

Sources and priorities:

- Treesitter: `capture.hl_group` is `@<capture>.<lang>`; priority is
  `metadata.priority` or `priorities.treesitter`. Theme fallback:
  `@capture.lang` → `@capture` → parent capture (`@a.b` → `@a`).
- LSP: `@lsp.type.<type>.<ft>` = 125, `@lsp.mod.<mod>.<ft>` = 126,
  `@lsp.typemod.<type>.<mod>.<ft>` = 127. Fallback: language-specific →
  generic → linked Treesitter capture.
- Extmarks: `opts.hl_group` (string or id), `opts.priority`, `extmark.ns`.
  Diagnostics = 150; user extmarks are usually 200.
- Legacy syntax: `synstack`; `synIDtrans` resolves links; priority =
  `priorities.syntax`.

Winner selection:

- Sort by priority ascending; merge attributes; higher priority overrides the
  conflicting attribute.
- Treesitter (100) > syntax (50); LSP (125+) > Treesitter; diagnostics (150) >
  LSP; user (200) > everything.
- `:Inspect` shows traversal order, not the winner; compute the winner from
  priorities.
- Avoid designs that depend on equal priorities.

### 5.5 Effective color

```lua
local function resolve(group)
	local link = vim.api.nvim_get_hl(0, { name = group, link = true, create = false })
	local hl = vim.api.nvim_get_hl(0, { name = group, link = false, create = false })
	return link, hl
end

local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
local fg = hl.fg or normal.fg
local bg = hl.bg or normal.bg
local hex = function(n)
	return n and string.format("#%06X", n) or nil
end
```

Rules:

- `link = true` shows the link target; `link = false` resolves links.
- Always use `create = false`; `nvim_get_hl_id_by_name` allocates ids.
- Empty group → walk the fallback chain → transparent → lower layers/`Normal`.
- Unset `fg`/`bg` fall back to `Normal` (floats: `NormalFloat`).
- Apply `reverse` (swap fg/bg), `blend` (context-dependent; report it),
  `nocombine`.
- Apply `winhighlight` before resolving: parse `vim.wo[win].winhl`
  (`Normal:MyNormal,...`). Window-local highlight namespace takes precedence
  over `winhl`; `winhl` takes precedence over global groups.
- Floats use `NormalFloat`/`FloatBorder`; `Pmenu*`, `StatusLine*`, `TabLine*`,
  `WinBar*`, `MsgArea` use their own groups and integration theme tables.
  `inspect_pos` does not cover them.
- `screenattr()` is only an arbitrary attribute id for comparison;
  `nvim__inspect_cell()` is experimental and needs a UI with hlstate. Use them
  only as a last check of a rendered cell and state the limitation.
- With `termguicolors = false`, resolve `ctermfg`/`ctermbg` and the terminal
  palette instead of 24-bit hex.

### 5.6 UI elements outside the buffer

- Float: `NormalFloat`, `FloatBorder`, `FloatTitle`, plugin float groups.
- Popup: `Pmenu`, `PmenuSel`, `PmenuSbar`, `PmenuThumb`.
- Statusline: `StatusLine`, `StatusLineNC`, lualine theme table.
- Tabline: `TabLine`, `TabLineFill`, `TabLineSel`.
- Winbar: `WinBar`, `WinBarNC`, barbecue theme table.
- Cmdline/messages: `MsgArea`, noice groups.
- Signs/statuscolumn: `SignColumn`, diagnostic signs, gitsigns,
  `StatusColumn`.
- Splits: `WinSeparator`, `VertSplit`.

### 5.7 Exception comments

When a specific color intentionally does not follow the rules, mark it:

```lua
-- hl-exception(SomeGroup): upstream plugin paints this token red; source: :Inspect @function.call.lua, plugin@<tag>
SomeGroup = { fg = p.coral },
```

Requirements:

- name the group, the reason, and the source of truth;
- for a file-wide exception, add the marker to the file header;
- `scripts/check.sh` validates the marker format and that the group name
  appears in the file;
- semantic deviation cannot be detected automatically; it requires review;
- fix bugs instead of commenting them;
- if only the inherited color differs, prefer `link` to the canonical group.

### 5.8 Tooling

- `lua/yugen-ash/inspect.lua` contains the read-only inspection logic.
- `:YugenAshInspect [group]`:
  - no argument: cursor position, sources, priorities, winner, link chain,
    resolved fg/bg hex, `Normal` fallback, `winhl`;
  - with an argument: group definition, link chain, resolved attributes,
    `:verbose hi`;
  - `:YugenAshInspect!` includes extmarks without `hl_group`.
- `scripts/inspect.lua` is a thin headless wrapper:
  `nvim -l scripts/inspect.lua [group]`.
- `scripts/check.sh` checks definitions, links, registration, style keys, and
  exception markers. Rendered colors are verified manually with a UI.

The inspector must be read-only: no `nvim_set_hl`, no `create = true`, no
buffer changes.

### 5.9 Verification workflow for a group

1. Reproduce with the plugin/language and the theme loaded.
2. `:Inspect` at the exact token; record TS capture/LSP token/syntax stack/
   extmarks and priorities.
3. Cross-check the group name in the plugin source or Neovim docs.
4. Search the theme for an existing owner and role.
5. Implement with palette roles/tokens; add `hl-exception` if needed.
6. `:hi <group>` and `nvim_get_hl(..., link = false)` to verify the color.
7. `:YugenAshCompile` and re-inspect.
8. Add a regression note if the group is fragile.

---

## 6. Legacy debt & migration

The theme is migrated incrementally; rules above are the target. Fix each item
when touching the file. Do not perform a big-bang rewrite.

| Item | Target |
|---|---|
| `@property` / `@variable.member` drift in python/ruby/json/toml/yaml/css/dockerfile/cmake/svelte | `color300` (Elixir member = `seafoam` exception) |
| `@string.special` drift | symbol `seafoam`, path `sage`, uri `seafoam` + underline, other `coral` |
| `@attribute` without italic in elixir/zig/sql/erlang | `amber` + `styles.italic` |
| Plugin chrome still on `p.color700`/`p.color500` | `styles.panel`, `styles.statusline`, `groups.border` |
| Plugin git/diff colors not using `groups.git_*` | `groups.git_*` |
| Completion/picker `Value`/`Unit` icons (cmp, blink, snacks) | `tide` |

---

## 7. Verification

Required after a change:

```bash
scripts/check.sh
```

The script:

1. loads the theme headlessly with `compile = false` and `compile = true`;
2. checks that every `groups/langs/*` and `groups/plugins/*` file is registered;
3. rejects raw hex in `groups/`;
4. checks that every `styles.<key>` used is defined in `theme.lua`;
5. flags literal `style = "italic"`;
6. validates `hl-exception(...)` markers;
7. runs `stylua` and `luacheck` when they are installed.

Language highlight coverage:

```bash
scripts/test-highlights.sh ruby
```

The check opens the fixture, enables legacy syntax and Treesitter, scans every
buffer position, and compares the groups seen with the groups declared by
`groups/langs/<lang>.lua`. It fails on reachable groups the fixture does not
demonstrate. `@lsp.*` groups are static-only and `tests/expected/<lang>.lua`
documents groups the runtime cannot emit. See `tests/README.md`.

Manual checks:

- `:YugenAshCompile` completes without errors;
- `:YugenAshInspect` at the changed token shows the expected group and color;
- `:hi <group>` and `nvim_get_hl(0, { name = group, link = false })` agree;
- the color holds in every variant (`main`, `rich`, `muted`, `vibrant`,
  `light`).
