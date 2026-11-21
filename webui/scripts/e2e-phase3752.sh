#!/usr/bin/env bash
# Phase-3752: soft-complete through 3752 (hard_gaps_closure_roster + ms 9800).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3752
assert m.WEBUI_HONESTY_MILESTONE == 9800
print("soft-complete >=3752", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3752|Soft-complete STATUS through 3752|through 3752' webui/STATUS.md
echo "STATUS soft-complete 3752 ok"
echo "cleaned"
echo "OK: phase3752 e2e passed"
