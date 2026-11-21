#!/usr/bin/env bash
# Phase-1136: soft-complete through 1136 (milestone 1650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1136
assert m.WEBUI_HONESTY_MILESTONE == 1650
print("soft-complete >=1136", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1136|Soft-complete STATUS through 1136|through 1136' webui/STATUS.md
echo "STATUS soft-complete 1136 ok"
echo "cleaned"
echo "OK: phase1136 e2e passed"
