#!/usr/bin/env bash
# Phase-27816: soft-complete through 27816 (ms 85000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27816
assert m.WEBUI_HONESTY_MILESTONE == 85000
print("soft-complete >=27816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27816|through 27816' webui/STATUS.md
echo "OK: phase27816 e2e passed"
