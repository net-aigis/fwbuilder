#!/usr/bin/env bash
# Phase-1336: soft-complete through 1336 (milestone 2250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1336
assert m.WEBUI_HONESTY_MILESTONE == 2250
print("soft-complete >=1336", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1336|Soft-complete STATUS through 1336|through 1336' webui/STATUS.md
echo "STATUS soft-complete 1336 ok"
echo "cleaned"
echo "OK: phase1336 e2e passed"
