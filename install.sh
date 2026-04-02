#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TYPST_LOCAL_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local"

echo "📂 Typst Local Packages Path: $TYPST_LOCAL_DIR"
echo "📁 Template Repository Root: $ROOT_DIR"
echo "------------------------------------------------"

shopt -s nullglob

for dir in "$ROOT_DIR"/*/; do
    pkg_dir="${dir%/}"
    toml_file="$pkg_dir/typst.toml"

    if [[ ! -f "$toml_file" ]]; then
        continue
    fi

    pkg_name="$(grep -E '^name\s*=' "$toml_file" | head -n 1 | cut -d'"' -f2)"
    pkg_version="$(grep -E '^version\s*=' "$toml_file" | head -n 1 | cut -d'"' -f2)"

    if [[ -z "$pkg_name" || -z "$pkg_version" ]]; then
        echo "⚠️  Skipping $pkg_dir: invalid typst.toml"
        continue
    fi

    target_parent="$TYPST_LOCAL_DIR/$pkg_name"
    target_path="$target_parent/$pkg_version"
    source_path="$pkg_dir"

    echo "📦 Linking package: $pkg_name ($pkg_version)"

    mkdir -p "$target_parent"

    if [[ -d "$target_path" && ! -L "$target_path" ]]; then
        echo "   🗑️  Removing existing directory at destination..."
        rm -rf "$target_path"
    fi

    ln -snf "$source_path" "$target_path"
    echo "   ✅ Success: $target_path -> $source_path"
done

echo "------------------------------------------------"
