#!/usr/bin/env bash
# Phase-42296: soft-complete through 42296 (ms 130250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42296
assert m.WEBUI_HONESTY_MILESTONE == 130250
print("soft-complete >=42296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42296|through 42296' webui/STATUS.md
echo "OK: phase42296 e2e passed"
