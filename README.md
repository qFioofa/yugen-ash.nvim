# yugen-ash.nvim

A minimal dark theme for Neovim.

## Installation

**lazy.nvim:**

```lua
{
    "qfioofa/yugen-ash.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("yugen_ash").setup({ variant = "muted" })
        vim.cmd("colorscheme yugen-ash")
    end,
}
```

**packer.nvim:**

```lua
use { "qfioofa/yugen-ash.nvim" }
```

## Usage

```lua
require("yugen_ash").setup({ variant = "muted" })
vim.cmd("colorscheme yugen-ash")
```

## Options

```lua
{
    variant = "main",      -- main, rich, muted, vibrant, light
    transparent = false,
    transparent_statusline = false,
    disable_italics = false,
    dim_nc_background = false,
    bold_vert_split = false,
    compile = true,        -- cache the compiled theme for faster startup
}
```

## Highlighting logic

Colors are assigned by **semantic role**, not per language: a given role gets
the same color everywhere, and each language file just maps its syntax/
Treesitter groups onto these roles. This keeps every language consistent and
makes related concepts visually distinct.

| Color      | Role                                                                                          |
| ---------- | --------------------------------------------------------------------------------------------- |
| `crimson`  | Keywords, declarations, storage/modifiers, structures, imports/includes                       |
| `tide`     | Control flow (conditional, loop, case, exception), booleans, all constants                    |
| `frost`    | Operators (kept distinct from control-flow keywords)                                          |
| `violet`   | Numbers, builtin variables, `null`/`nil`/`None`                                               |
| `sage`     | Strings, characters, markup tags                                                              |
| `primary`  | All functions — names, calls, builtins, methods, macros and constructors; headings; link text |
| `gold`     | Types, classes/structs/enums, `@type.definition`                                              |
| `amber`    | Builtin types, annotations/decorators/attributes                                              |
| `seafoam`  | Labels, atoms/symbols, staged git state                                                       |
| `coral`    | Interpolation, regexp, special punctuation, renamed git state                                 |
| `rust`     | Escape sequences and special characters (kept distinct from types)                            |
| `color200` | Plain text and variables                                                                      |
| `color300` | Object properties, members and fields                                                         |
| `color400` | Comments and punctuation/delimiters                                                           |
| `color500` | Muted/inactive text                                                                           |

Three roles are deliberately separated from neighbours they used to share:
**operators** use `frost` so they no longer blend into the `tide` control-flow
keywords, **escapes** use `rust` so they stand apart from `gold` types, and
**constants** use `tide` while **numbers** use `violet`. Imports are part of
the keyword family (`crimson`), and `@type.definition` follows types (`gold`).
LSP semantic tokens (`@lsp.type.*` / `@lsp.typemod.*`) are linked to the
matching Treesitter captures, so they follow the same roles whether or not a
server provides them. All variants (`main`, `rich`, `muted`, `vibrant`,
`light`) share this role mapping and only swap the underlying hex values.

UI chrome is driven by the live `setup.groups` tokens: `background`, `panel`,
`statusline`, `border`, `comment`, `punctuation`, `link`, `error`/`warn`/
`info`/`hint`, `git_*`, and `headings.h1..h6`. Floats and menus use
`groups.panel`, borders use `groups.border`, and statusline/tabline use
`groups.statusline`.

## Commands

The theme is compiled once and cached under `stdpath("cache")/yugen-ash`, then
reloaded on subsequent startups. The cache is keyed by your config and
invalidated automatically when the theme sources change, so you normally never
need to touch it.

| Command                    | Description                                                             |
| -------------------------- | ----------------------------------------------------------------------- |
| `:YugenAshClean`           | Remove the compiled cache.                                              |
| `:YugenAshCompile`         | Rebuild the cache and reload the colorscheme.                           |
| `:YugenAshInspect [group]` | Inspect the cursor position (or a group) and print the effective color. |
| `:YugenAshInspect!`        | Same as above, including extmarks without a highlight group.            |

Tips:

- After editing the theme sources, the cache rebuilds itself on the next load.
  Run `:YugenAshCompile` to force it immediately, or `:YugenAshClean` to drop
  the cache and rebuild on the next `colorscheme yugen-ash`.
- To disable caching entirely, set `compile = false` in `setup`.
- The same commands are available from Lua:
    ```lua
    require("yugen-ash").clean() -- drop the cache
    ```

## Testing language highlights

Each language has a showcase fixture under `tests/fixtures/langs/` that
demonstrates the groups declared by its module plus the common base captures.
See `tests/README.md` for the full workflow and debug commands.

```bash
# Headless coverage check
scripts/test-highlights.sh ruby

# Open the fixture with the theme and Treesitter
nvim -u tests/minimal_init.lua tests/fixtures/langs/ruby.rb
```

## Preview

## Credits

Based on:

- [yugen.nvim](https://github.com/bettervim/yugen.nvim)
- [ash.nvim](https://github.com/drewxs/ash.nvim)

