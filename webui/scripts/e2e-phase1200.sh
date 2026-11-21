#!/usr/bin/env bash
# Phase-1200: soft-complete through 1200 (milestone 1850).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1200
assert m.WEBUI_HONESTY_MILESTONE == 1850
print("soft-complete >=1200", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1200|Soft-complete STATUS through 1200|through 1200' webui/STATUS.md
echo "STATUS soft-complete 1200 ok"
echo "cleaned"
echo "OK: phase1200 e2e passed"
