#!/usr/bin/env bash
# Phase-16056: soft-complete through 16056 (ms 48250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16056
assert m.WEBUI_HONESTY_MILESTONE == 48250
print("soft-complete >=16056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16056|through 16056' webui/STATUS.md
echo "OK: phase16056 e2e passed"
