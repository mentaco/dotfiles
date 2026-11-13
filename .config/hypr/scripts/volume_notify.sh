#!/usr/bin/env bash
set -euo pipefail

STEP="${STEP:-5%}"
SINK="@DEFAULT_AUDIO_SINK@"
MAX="${MAX:-1.5}"   # 150% 上限（不要なら 1.0 にするか -l を消す）

get_percent() {
  # wpctl get-volume の出力例: "Volume: 0.42 [MUTED]"
  local v muted
  v="$(wpctl get-volume "$SINK" | awk '{print $2}')"            # 0.42
  muted="$(wpctl get-volume "$SINK" | grep -q '\[MUTED\]' && echo 1 || echo 0)"
  # 0.42 -> 42
  python3 - <<'PY' "$v" "$muted"
import sys
v=float(sys.argv[1])
muted=int(sys.argv[2])
pct=round(v*100)
print(f"{pct}%{' (muted)' if muted else ''}")
PY
}

# notify() {
#   local msg="$1"
#   # 同じ通知を更新したいなら -r を使う（ID固定）
#   notify-send -a "Volume" -u low -r 12345 "🔊 Volume" "$msg"
# }

case "${1:-}" in
  up)
    wpctl set-volume -l "$MAX" "$SINK" "${STEP}+"
    # notify "$(get_percent)"
    ;;
  down)
    wpctl set-volume -l "$MAX" "$SINK" "${STEP}-"
    # notify "$(get_percent)"
    ;;
  mute)
    wpctl set-mute "$SINK" toggle
    # notify "$(get_percent)"
    ;;
  *)
    echo "usage: $0 {up|down|mute}" >&2
    exit 2
    ;;
esac
