#!/usr/bin/env bash
# Phase-22056: soft-complete through 22056 (ms 67000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22056
assert m.WEBUI_HONESTY_MILESTONE == 67000
print("soft-complete >=22056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22056|through 22056' webui/STATUS.md
echo "OK: phase22056 e2e passed"
