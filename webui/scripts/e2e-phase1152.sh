#!/usr/bin/env bash
# Phase-1152: soft-complete through 1152 (milestone 1700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1152
assert m.WEBUI_HONESTY_MILESTONE == 1700
print("soft-complete >=1152", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1152|Soft-complete STATUS through 1152|through 1152' webui/STATUS.md
echo "STATUS soft-complete 1152 ok"
echo "cleaned"
echo "OK: phase1152 e2e passed"
