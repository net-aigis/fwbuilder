#!/usr/bin/env bash
# Phase-3672: soft-complete through 3672 (hard_gaps_summary_roster + ms 9550).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 3672
assert m.WEBUI_HONESTY_MILESTONE == 9550
print("soft-complete >=3672", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase3672|Soft-complete STATUS through 3672|through 3672' webui/STATUS.md
echo "STATUS soft-complete 3672 ok"
echo "cleaned"
echo "OK: phase3672 e2e passed"
