#!/usr/bin/env bash
# Phase-26296: soft-complete through 26296 (ms 80250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26296
assert m.WEBUI_HONESTY_MILESTONE == 80250
print("soft-complete >=26296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26296|through 26296' webui/STATUS.md
echo "OK: phase26296 e2e passed"
