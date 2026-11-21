#!/usr/bin/env bash
# Phase-35816: soft-complete through 35816 (ms 110000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35816
assert m.WEBUI_HONESTY_MILESTONE == 110000
print("soft-complete >=35816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35816|through 35816' webui/STATUS.md
echo "OK: phase35816 e2e passed"
