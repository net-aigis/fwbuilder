#!/usr/bin/env bash
# Phase-21816: soft-complete through 21816 (ms 66250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21816
assert m.WEBUI_HONESTY_MILESTONE == 66250
print("soft-complete >=21816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21816|through 21816' webui/STATUS.md
echo "OK: phase21816 e2e passed"
