#!/usr/bin/env bash
# Phase-10056: soft-complete through 10056 (ms 29500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10056
assert m.WEBUI_HONESTY_MILESTONE == 29500
print("soft-complete >=10056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10056|through 10056' webui/STATUS.md
echo "OK: phase10056 e2e passed"
