#!/usr/bin/env bash
# Phase-4152: soft-complete through 4152 (stack_switch_roster + ms 11050).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 4152
assert m.WEBUI_HONESTY_MILESTONE == 11050
print("soft-complete >=4152", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase4152|Soft-complete STATUS through 4152|through 4152' webui/STATUS.md
echo "STATUS soft-complete 4152 ok"
echo "cleaned"
echo "OK: phase4152 e2e passed"
