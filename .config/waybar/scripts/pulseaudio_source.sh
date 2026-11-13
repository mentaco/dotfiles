#!/usr/bin/env bash
set -euo pipefail

out="$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null || true)"
# 例: "Volume: 0.55" / "Volume: 0.55 [MUTED]"
vol="$(printf '%s\n' "$out" | awk '{print $2}' | head -n1)"
muted="$(printf '%s\n' "$out" | grep -q '\[MUTED\]' && echo 1 || echo 0)"

# 0.55 -> 55
pct="$(python3 - <<PY
v="$vol"
try:
  print(int(round(float(v)*100)))
except:
  print(0)
PY
)"

if [ "$muted" = "1" ]; then
  echo "  ${pct}%"
else
  echo " ${pct}%"
fi
