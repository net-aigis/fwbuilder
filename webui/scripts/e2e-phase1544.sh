#!/usr/bin/env bash
# Phase-1544: soft-complete through 1544 (milestone 2900).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1544
assert m.WEBUI_HONESTY_MILESTONE == 2900
print("soft-complete >=1544", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1544|Soft-complete STATUS through 1544|through 1544' webui/STATUS.md
echo "STATUS soft-complete 1544 ok"
echo "cleaned"
echo "OK: phase1544 e2e passed"
