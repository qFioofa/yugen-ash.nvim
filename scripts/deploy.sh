#!/bin/bash

set -e

PLUGIN_NAME="yugen-ash.nvim"
PLUGIN_DIR="$(cd "$(dirname "$0")" && cd .. && pwd)"
NEOVM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
TARGET_DIR="$NEOVM_CONFIG_DIR/pack/plugins/start/$PLUGIN_NAME"

mkdir -p "$(dirname "$TARGET_DIR")"

[ -d "$TARGET_DIR" ] && rm -rf "$TARGET_DIR"

cp -r "$PLUGIN_DIR" "$TARGET_DIR"

echo "Deployed to: $TARGET_DIR"