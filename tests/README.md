# Language highlight fixtures

Each language fixture is a small source file that demonstrates the groups
declared in `lua/yugen-ash/groups/langs/<lang>.lua` plus the common base
captures (comments, numbers, strings, keywords, functions, ...). The headless
check compares the groups declared by the module with the groups actually
highlighted in the fixture.

## Layout

```text
tests/
  manifest.lua              language -> fixture/filetype/parser/syntax
  minimal_init.lua          open a fixture with the theme and Treesitter
  parser_paths.lua          adds common nvim-treesitter parser locations
  run.lua                   headless coverage check
  expected/<lang>.lua       documented groups the runtime cannot emit
  fixtures/langs/<lang>.<ext>
```

## Quick start

```bash
# Coverage check for one language
scripts/test-highlights.sh ruby

# All fixtures in the manifest
scripts/test-highlights.sh --all

# Verbose report (also lists demonstrated and skipped groups)
scripts/test-highlights.sh ruby --verbose

# Report without failing on missing groups
scripts/test-highlights.sh ruby --report

# Pick a theme variant
scripts/test-highlights.sh ruby --variant light
```

Manual inspection:

```bash
nvim -u tests/minimal_init.lua tests/fixtures/langs/ruby.rb
YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/ruby.rb
```

If the parser is not on `runtimepath`, point the check at it explicitly:

```bash
YUGEN_ASH_PARSER_PATH=/path/to/nvim-treesitter scripts/test-highlights.sh ruby
```

## Debug commands

At the cursor in a fixture:

| Command | Purpose |
|---|---|
| `:Inspect` | syntax / Treesitter / LSP / extmark groups at the cursor |
| `:InspectTree` | Treesitter tree and captures |
| `:YugenAshInspect` | sources, priorities, winner, effective color |
| `:YugenAshInspect <group>` | definition, link chain, resolved color |
| `:YugenAshInspect!` | include extmarks without `hl_group` |
| `:hi <group>` | definition / link |
| `:verbose hi <group>` | where the group was set |
| `:lua =vim.inspect_pos()` | raw inspection table |
| `:lua =vim.treesitter.get_captures_at_pos(0, row, col)` | raw captures |
| `:YugenAshCompile` | rebuild the cache after editing theme sources |

Useful checks:

```vim
:setlocal filetype?
:setlocal syntax?
:lua =vim.bo.syntax
:lua =vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()]
```

## Reading the report

```text
declared=75 demonstrated=50 lsp-only=8 allowlisted/skipped=17 missing=0
```

- `declared` — groups returned by the language module.
- `demonstrated` — groups seen in the fixture, including groups reached through
  a `link` chain or a Treesitter fallback (`@a.b.lang` -> `@a.b` -> `@a`).
- `lsp-only` — `@lsp.*` groups. They need a live language server; their link
  targets are validated by `scripts/check.sh`.
- `allowlisted/skipped` — groups listed in `tests/expected/<lang>.lua`, or
  groups skipped because the parser/syntax file is unavailable.
- `missing` — reachable groups that the fixture does not demonstrate. The check
  exits non-zero when this list or `common missing` is non-empty.
- `stale allowlist` — entries in `tests/expected/<lang>.lua` that are no longer
  declared or are now demonstrated. This is an error, even with `--report`.

If a parser or legacy syntax file is unavailable, the check reports `SKIP` for
that source and does not fail. Install the parser (or set
`YUGEN_ASH_PARSER_PATH`) to get full coverage.

## Adding a language

See `tests/fixtures/langs/TEMPLATE.md`. In short:

1. Add `tests/fixtures/langs/<parser-id>.<ext>`.
2. Add an entry to `tests/manifest.lua`.
3. Run `scripts/test-highlights.sh <lang>`.
4. Add the missing constructs to the fixture.
5. Only then document genuinely unreachable groups in
   `tests/expected/<lang>.lua`, with the source that was checked.
6. Run `scripts/check.sh`.

## Allowlist policy

`tests/expected/<lang>.lua` is for groups the current runtime cannot emit:

- legacy groups absent from the bundled `$VIMRUNTIME/syntax/<lang>.vim`;
- Treesitter captures absent from the installed highlight query;
- groups that only exist for a plugin or an LSP server.

Do not use the allowlist to hide a group that the fixture simply forgot to
exercise. If a group is obsolete, propose removing it from the language module
instead of allowlisting it silently.

## Limitations

- Live LSP semantic tokens are not exercised. `@lsp.*` links are checked
  statically by `scripts/check.sh`.
- Plugin highlight groups are out of scope for the language fixtures.
- Rendered colors are checked manually; the coverage check verifies group
  names, not hex values.
- The result depends on the installed syntax files and Treesitter query
  version. The allowlist records what was checked.
