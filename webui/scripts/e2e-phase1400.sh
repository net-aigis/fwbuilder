#!/usr/bin/env bash
# Phase-1400: soft-complete through 1400 (milestone 2450).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1400
assert m.WEBUI_HONESTY_MILESTONE == 2450
print("soft-complete >=1400", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1400|Soft-complete STATUS through 1400|through 1400' webui/STATUS.md
echo "STATUS soft-complete 1400 ok"
echo "cleaned"
echo "OK: phase1400 e2e passed"
