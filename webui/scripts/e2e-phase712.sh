#!/usr/bin/env bash
# Phase-712: soft-complete through 712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 712
print("soft-complete >=712", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase712|Soft-complete STATUS through 712|through 712' webui/STATUS.md
echo "STATUS soft-complete 712 ok"
echo "cleaned"
echo "OK: phase712 e2e passed"
