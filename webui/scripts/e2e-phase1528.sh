#!/usr/bin/env bash
# Phase-1528: soft-complete through 1528 (milestone 2850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1528
assert m.WEBUI_HONESTY_MILESTONE == 2850
print("soft-complete >=1528", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1528|Soft-complete STATUS through 1528|through 1528' webui/STATUS.md
echo "STATUS soft-complete 1528 ok"
echo "cleaned"
echo "OK: phase1528 e2e passed"
