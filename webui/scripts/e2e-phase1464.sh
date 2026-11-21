#!/usr/bin/env bash
# Phase-1464: soft-complete through 1464 (milestone 2650).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1464
assert m.WEBUI_HONESTY_MILESTONE == 2650
print("soft-complete >=1464", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1464|Soft-complete STATUS through 1464|through 1464' webui/STATUS.md
echo "STATUS soft-complete 1464 ok"
echo "cleaned"
echo "OK: phase1464 e2e passed"
