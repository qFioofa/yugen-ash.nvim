#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NVIM_BIN="${NVIM_BIN:-nvim}"
TMP_CACHE="$(mktemp -d)"
trap 'rm -rf "$TMP_CACHE"' EXIT

fail() {
	echo "check: $*" >&2
	exit 1
}

if ! command -v "$NVIM_BIN" >/dev/null 2>&1; then
	fail "'$NVIM_BIN' not found (set NVIM_BIN to the Neovim executable)"
fi

load_theme() {
	local compile="$1"
	XDG_CACHE_HOME="$TMP_CACHE" "$NVIM_BIN" --headless -u NONE -i NONE \
		-c "set runtimepath^=$ROOT" \
		-c "lua require('yugen-ash').setup({ compile = $compile })" \
		-c "colorscheme yugen-ash" \
		-c "YugenAshInspect Normal" \
		-c "qa!" 2>&1
}

echo "check: loading theme (compile = false)"
load_theme false >/dev/null || fail "theme failed to load with compile = false"

echo "check: loading theme (compile = true)"
load_theme true >/dev/null || fail "theme failed to load with compile = true"

echo "check: link targets and cycles"
link_check='local c=require("yugen-ash").get_config(); local t=require("yugen-ash.theme").get(c); for g,s in pairs(t) do if type(s)=="table" and s.link then if vim.fn.hlexists(s.link)==0 then error(("missing link target: %s -> %s"):format(g,s.link)) end; local seen={}; local cur=g; while true do if seen[cur] then error(("link cycle at %s"):format(cur)) end; seen[cur]=true; local hl=vim.api.nvim_get_hl(0,{name=cur,link=true,create=false}); if not hl.link then break end; cur=hl.link end end end'
XDG_CACHE_HOME="$TMP_CACHE" "$NVIM_BIN" --headless -u NONE -i NONE \
	-c "set runtimepath^=$ROOT" \
	-c "lua require('yugen-ash').setup({ compile = false })" \
	-c "colorscheme yugen-ash" \
	-c "lua $link_check" \
	-c "qa!" >/dev/null 2>&1 || fail "link target or cycle check failed"

echo "check: module registration"
files="$(find "$ROOT/lua/yugen-ash/groups/langs" "$ROOT/lua/yugen-ash/groups/plugins" -name '*.lua' -printf '%f\n' |
	sed 's/\.lua$//' | sort)"
registered="$(grep -oE 'yugen-ash\.groups\.(langs|plugins)\.[a-z0-9_-]+' "$ROOT/lua/yugen-ash/theme.lua" |
	sed -E 's/yugen-ash\.groups\.(langs|plugins)\.//' | sort)"

missing="$(comm -23 <(printf '%s\n' "$files") <(printf '%s\n' "$registered"))"
extra="$(comm -13 <(printf '%s\n' "$files") <(printf '%s\n' "$registered"))"

if [ -n "$missing" ]; then
	fail "unregistered modules: $(printf '%s' "$missing" | tr '\n' ' ')"
fi
if [ -n "$extra" ]; then
	fail "registered modules without a file: $(printf '%s' "$extra" | tr '\n' ' ')"
fi

echo "check: no raw hex in group modules"
if grep -RInE '#[0-9A-Fa-f]{6}' "$ROOT/lua/yugen-ash/groups" >/dev/null; then
	grep -RInE '#[0-9A-Fa-f]{6}' "$ROOT/lua/yugen-ash/groups" >&2
	fail "raw hex is not allowed in lua/yugen-ash/groups"
fi

echo "check: style keys"
used_styles="$(grep -rhoE 'styles\.[a-z_]+' "$ROOT/lua/yugen-ash/groups" |
	sed 's/styles\.//' | sort -u)"
defined_styles="$(
	{
		sed -n '/local styles = {/,/}/p' "$ROOT/lua/yugen-ash/theme.lua" |
			grep -oE '^[[:space:]]*[a-z_]+[[:space:]]*=' |
			sed -E 's/^[[:space:]]*([a-z_]+).*/\1/'
		grep -oE 'styles\.[a-z_]+' "$ROOT/lua/yugen-ash/theme.lua" | sed 's/styles\.//'
	} | sort -u
)"
for key in $used_styles; do
	if ! printf '%s\n' "$defined_styles" | grep -qx "$key"; then
		fail "styles.$key is used but not defined in theme.lua"
	fi
done

echo "check: literal italics"
if grep -RIn 'style = "italic"' "$ROOT/lua/yugen-ash/groups" >/dev/null; then
	grep -RIn 'style = "italic"' "$ROOT/lua/yugen-ash/groups" >&2
	fail "use styles.italic instead of style = \"italic\""
fi

echo "check: hl-exception markers"
while IFS=: read -r file line marker; do
	group="$(printf '%s' "$marker" | sed -n 's/.*hl-exception(\([^)]*\)).*/\1/p')"
	if [ -z "$group" ]; then
		fail "$file:$line: malformed hl-exception marker"
	fi
	if ! printf '%s' "$marker" | grep -q 'source:'; then
		fail "$file:$line: hl-exception must include a source: field"
	fi
	if ! grep -Fq "$group" "$file"; then
		fail "$file:$line: hl-exception group '$group' is not defined in this file"
	fi
done < <(grep -RIn 'hl-exception(' "$ROOT/lua/yugen-ash/groups" || true)

if command -v stylua >/dev/null 2>&1; then
	echo "check: stylua"
	stylua --check "$ROOT" >/dev/null || fail "stylua reported formatting issues"
else
	echo "check: stylua not installed, skipping"
fi

if command -v luacheck >/dev/null 2>&1; then
	echo "check: luacheck"
	luacheck "$ROOT/lua" >/dev/null || fail "luacheck reported issues"
else
	echo "check: luacheck not installed, skipping"
fi

echo "check: ok"
