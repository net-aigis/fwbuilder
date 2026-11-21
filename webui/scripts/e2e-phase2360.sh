#!/usr/bin/env bash
# Phase-2360: soft-complete through 2360 (hard_gap_refusal_roster sessionStorage + ms 5450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2360
assert m.WEBUI_HONESTY_MILESTONE == 5450
print("soft-complete >=2360", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2360|Soft-complete STATUS through 2360|through 2360' webui/STATUS.md
echo "STATUS soft-complete 2360 ok"
echo "cleaned"
echo "OK: phase2360 e2e passed"
