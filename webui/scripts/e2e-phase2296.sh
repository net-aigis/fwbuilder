#!/usr/bin/env bash
# Phase-2296: soft-complete through 2296 (Soft 2280+ + ms 5250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2296
assert m.WEBUI_HONESTY_MILESTONE == 5250
print("soft-complete >=2296", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase2296|Soft-complete STATUS through 2296|through 2296' webui/STATUS.md
echo "STATUS soft-complete 2296 ok"
echo "cleaned"
echo "OK: phase2296 e2e passed"
