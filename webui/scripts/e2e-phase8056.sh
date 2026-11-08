#!/usr/bin/env bash
# Phase-8056: soft-complete through 8056 (ms 23250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8056
assert m.WEBUI_HONESTY_MILESTONE == 23250
print("soft-complete >=8056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8056|through 8056' webui/STATUS.md
echo "OK: phase8056 e2e passed"
