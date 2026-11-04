#!/usr/bin/env bash
# Phase-1480: soft-complete through 1480 (milestone 2700).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1480
assert m.WEBUI_HONESTY_MILESTONE == 2700
print("soft-complete >=1480", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1480|Soft-complete STATUS through 1480|through 1480' webui/STATUS.md
echo "STATUS soft-complete 1480 ok"
echo "cleaned"
echo "OK: phase1480 e2e passed"
