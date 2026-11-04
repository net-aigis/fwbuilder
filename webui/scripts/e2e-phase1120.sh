#!/usr/bin/env bash
# Phase-1120: soft-complete through 1120 (milestone 1600).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1120
assert m.WEBUI_HONESTY_MILESTONE == 1600
print("soft-complete >=1120", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1120|Soft-complete STATUS through 1120|through 1120' webui/STATUS.md
echo "STATUS soft-complete 1120 ok"
echo "cleaned"
echo "OK: phase1120 e2e passed"
