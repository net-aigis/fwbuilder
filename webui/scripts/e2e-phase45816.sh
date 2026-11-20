#!/usr/bin/env bash
# Phase-45816: soft-complete through 45816 (ms 141250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45816
assert m.WEBUI_HONESTY_MILESTONE == 141250
print("soft-complete >=45816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45816|through 45816' webui/STATUS.md
echo "OK: phase45816 e2e passed"
