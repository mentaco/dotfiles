#!/usr/bin/env bash
set -euo pipefail

dir="${XDG_PICTURES_DIR:-$HOME/Pictures}"
mkdir -p "$dir"

geom="$(
  hyprctl clients -j \
  | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' \
  | slurp -r
)"

[ -n "${geom:-}" ] || exit 0

region="$(awk '{print $1" "$2}' <<< "$geom")"

grim -g "$region" "$dir/Screenshot_$(date +'%Y%m%d_%H-%M-%S').png"
