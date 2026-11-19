#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NVIM_BIN="${NVIM_BIN:-nvim}"
TMP_CACHE="$(mktemp -d)"
trap 'rm -rf "$TMP_CACHE"' EXIT

if ! command -v "$NVIM_BIN" >/dev/null 2>&1; then
	echo "test-highlights: '$NVIM_BIN' not found (set NVIM_BIN to the Neovim executable)" >&2
	exit 1
fi

XDG_CACHE_HOME="$TMP_CACHE" "$NVIM_BIN" --clean -l "$ROOT/tests/run.lua" "$@"
