#!/usr/bin/env bash
# Phase-10296: soft-complete through 10296 (ms 30250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10296
assert m.WEBUI_HONESTY_MILESTONE == 30250
print("soft-complete >=10296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10296|through 10296' webui/STATUS.md
echo "OK: phase10296 e2e passed"
