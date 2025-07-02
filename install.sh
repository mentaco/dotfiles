#!/bin/bash

set -ue

cd "$(dirname "$0")"
DOT_DIR="$(pwd)"
DOT_CONF_DIR="$(pwd)/.config"
EXCLUDES=(".git" ".gitconfig" ".gitignore" ".DS_Store")

is_excluded() {
	local name="$1"
	for exclude in "${EXCLUDES[@]}"; do
		[[ "$name" == "$exclude" ]] && return 0
	done
	[[ "$name" =~ \.swp$ ]] && return 0
	return 1
}

link_file() {
	local src="$1"
	local dest="$2"
	ln -snfv "$src" "$dest"
}

for f in "$DOT_DIR"/.??*; do
	name="$(basename "$f")"
	is_excluded "$name" && continue

	if [[ "$name" == ".config" ]]; then
		for cf in "$DOT_CONF_DIR"/*; do
            link_file "$cf" "$HOME/.config"
		done
	else
		link_file "$f" "$HOME"
	fi
done
