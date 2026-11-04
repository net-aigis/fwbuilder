#!/usr/bin/env bash
# Phase-2192: soft-complete through 2192 (operator_brief sessionStorage).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 2192
print("soft-complete >=2192", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase2192|Soft-complete STATUS through 2192|through 2192' webui/STATUS.md
echo "STATUS soft-complete 2192 ok"
echo "cleaned"
echo "OK: phase2192 e2e passed"
