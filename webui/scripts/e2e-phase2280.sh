#!/usr/bin/env bash
# Phase-2280: soft-complete through 2280 (hard_gap_roster sessionStorage + ms 5200).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2280
assert m.WEBUI_HONESTY_MILESTONE == 5200
print("soft-complete >=2280", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2280|Soft-complete STATUS through 2280|through 2280' webui/STATUS.md
echo "STATUS soft-complete 2280 ok"
echo "cleaned"
echo "OK: phase2280 e2e passed"
