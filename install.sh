#!/bin/bash

# Typst 本地包路径
TYPST_LOCAL_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local"

echo "📂 Typst Local Packages Path: $TYPST_LOCAL_DIR"
echo "------------------------------------------------"

# 遍历当前目录下的文件夹
for dir in */; do
    pkg_dir="${dir%/}"
    toml_file="$pkg_dir/typst.toml"

    if [[ -f "$toml_file" ]]; then
        pkg_name=$(grep -E "^name\s*=" "$toml_file" | cut -d'"' -f2)
        pkg_version=$(grep -E "^version\s*=" "$toml_file" | cut -d'"' -f2)

        if [[ -z "$pkg_name" || -z "$pkg_version" ]]; then
            echo "⚠️  Skipping $pkg_dir: Invalid typst.toml"
            continue
        fi

        # 目标路径: .../packages/local/包名/版本号
        target_parent="$TYPST_LOCAL_DIR/$pkg_name"
        target_path="$target_parent/$pkg_version"
        source_path="$(pwd)/$pkg_dir"

        echo "📦 Linking package: $pkg_name ($pkg_version)"

        # 1. 确保父目录存在 (.../local/resume)
        mkdir -p "$target_parent"

        # 2. 如果目标路径已存在且是文件夹(非软链接)，先强制删除
        # 防止 ln -s 把链接放到文件夹里面去
        if [[ -d "$target_path" && ! -L "$target_path" ]]; then
            echo "   🗑️  Removing existing directory at destination..."
            rm -rf "$target_path"
        fi

        # 3. 创建/更新软链接
        # -s: 软链
        # -n: 如果目标是链接到目录的符号链接，将其视为一般文件 (防止递归)
        # -f: 强制覆盖
        ln -snf "$source_path" "$target_path"

        if [[ $? -eq 0 ]]; then
            echo "   ✅ Success: $target_path -> $source_path"
        else
            echo "   ❌ Failed."
        fi
    fi
done
echo "------------------------------------------------"
