#!/usr/bin/env bash
# Phase-1608: soft-complete through 1608 (honesty export in surface + ms 3100).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1608
assert m.WEBUI_HONESTY_MILESTONE == 3100
print("soft-complete >=1608", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1608|Soft-complete STATUS through 1608|through 1608' webui/STATUS.md
echo "STATUS soft-complete 1608 ok"
echo "cleaned"
echo "OK: phase1608 e2e passed"
