# yugen-ash highlight showcase — JSON (.json)

Data-only fixture: JSON has no comments, so the usage header lives here.

```bash
nvim -u tests/minimal_init.lua tests/fixtures/langs/json.json
YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/json.json
scripts/test-highlights.sh json
```

Debug at the cursor: `:Inspect`, `:InspectTree`, `:YugenAshInspect`,
`:YugenAshInspect <group>`, `:hi <group>`, `:YugenAshCompile`.

Sections are implicit; each key/value pair exercises properties, strings,
numbers, booleans, `null`, escapes, brackets and delimiters.
