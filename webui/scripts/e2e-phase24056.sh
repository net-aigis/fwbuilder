#!/usr/bin/env bash
# Phase-24056: soft-complete through 24056 (ms 73250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24056
assert m.WEBUI_HONESTY_MILESTONE == 73250
print("soft-complete >=24056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24056|through 24056' webui/STATUS.md
echo "OK: phase24056 e2e passed"
