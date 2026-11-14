#!/usr/bin/env bash

set -euo pipefail

PLUGIN_NAME="yugen-ash.nvim"
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NVIM_BIN="${NVIM_BIN:-nvim}"

if ! command -v "$NVIM_BIN" >/dev/null 2>&1; then
	echo "error: '$NVIM_BIN' not found (set NVIM_BIN to the Neovim executable)" >&2
	exit 1
fi

nvim_version="$("$NVIM_BIN" --version)"
nvim_version="${nvim_version%%$'\n'*}"

nvim_lua() {
	"$NVIM_BIN" --headless -u NONE -i NONE "+lua $1" +qa 2>/dev/null
}

# Match the plugin-manager profile used by the config: an explicit
# NVIM_PROFILE wins, otherwise Neovim >= 0.12 uses the native pack backend.
profile="${NVIM_PROFILE:-}"
if [ -z "$profile" ]; then
	if [ "$(nvim_lua 'io.stdout:write(vim.fn.has("nvim-0.12"))')" = "1" ]; then
		profile="pack"
	else
		profile="lazy"
	fi
fi

data_dir="$(nvim_lua 'io.stdout:write(vim.fn.stdpath("data"))')"
if [ -z "$data_dir" ]; then
	echo "error: could not resolve Neovim stdpath('data')" >&2
	exit 1
fi

case "$profile" in
pack)
	target_dir="$data_dir/site/pack/core/opt/$PLUGIN_NAME"
	;;
lazy)
	target_dir="$data_dir/lazy/$PLUGIN_NAME"
	;;
*)
	echo "error: unknown profile '$profile' (expected 'pack' or 'lazy')" >&2
	exit 1
	;;
esac

mkdir -p "$(dirname "$target_dir")"

if [ -d "$target_dir" ]; then
	rm -rf "$target_dir"
fi

cp -a "$PLUGIN_DIR" "$target_dir"

echo "Neovim:  $nvim_version"
echo "Profile: $profile"
echo "Deployed to: $target_dir"
