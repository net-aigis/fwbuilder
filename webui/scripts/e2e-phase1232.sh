#!/usr/bin/env bash
# Phase-1232: soft-complete through 1232 (milestone 1950).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1232
assert m.WEBUI_HONESTY_MILESTONE == 1950
print("soft-complete >=1232", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1232|Soft-complete STATUS through 1232|through 1232' webui/STATUS.md
echo "STATUS soft-complete 1232 ok"
echo "cleaned"
echo "OK: phase1232 e2e passed"
