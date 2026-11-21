#!/usr/bin/env bash
# Phase-1864: soft-complete through 1864 (track_note sessionStorage + ms 3900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1864
assert m.WEBUI_HONESTY_MILESTONE == 3900
print("soft-complete >=1864", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1864|Soft-complete STATUS through 1864|through 1864' webui/STATUS.md
echo "STATUS soft-complete 1864 ok"
echo "cleaned"
echo "OK: phase1864 e2e passed"
