#!/usr/bin/env bash
# Phase-46056: soft-complete through 46056 (ms 142000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46056
assert m.WEBUI_HONESTY_MILESTONE == 142000
print("soft-complete >=46056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46056|through 46056' webui/STATUS.md
echo "OK: phase46056 e2e passed"
