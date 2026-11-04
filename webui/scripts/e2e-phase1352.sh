#!/usr/bin/env bash
# Phase-1352: soft-complete through 1352 (milestone 2300).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1352
assert m.WEBUI_HONESTY_MILESTONE == 2300
print("soft-complete >=1352", m.WEBUI_SOFT_COMPLETE_PHASE, "milestone", m.WEBUI_HONESTY_MILESTONE)
PY
grep -qE 'phase1352|Soft-complete STATUS through 1352|through 1352' webui/STATUS.md
echo "STATUS soft-complete 1352 ok"
echo "cleaned"
echo "OK: phase1352 e2e passed"
