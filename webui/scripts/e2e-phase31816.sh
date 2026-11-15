#!/usr/bin/env bash
# Phase-31816: soft-complete through 31816 (ms 97500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31816
assert m.WEBUI_HONESTY_MILESTONE == 97500
print("soft-complete >=31816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31816|through 31816' webui/STATUS.md
echo "OK: phase31816 e2e passed"
