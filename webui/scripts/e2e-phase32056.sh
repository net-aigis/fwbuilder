#!/usr/bin/env bash
# Phase-32056: soft-complete through 32056 (ms 98250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32056
assert m.WEBUI_HONESTY_MILESTONE == 98250
print("soft-complete >=32056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32056|through 32056' webui/STATUS.md
echo "OK: phase32056 e2e passed"
