#!/bin/bash

set -e

PLUGIN_NAME="yugen-ash.nvim"
PLUGIN_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
TARGET_DIR="$HOME/.local/share/nvim/lazy/$PLUGIN_NAME"

mkdir -p "$(dirname "$TARGET_DIR")"

[ -d "$TARGET_DIR" ] && rm -rf "$TARGET_DIR"

cp -r "$PLUGIN_DIR" "$TARGET_DIR"

echo "Deployed to: $TARGET_DIR"