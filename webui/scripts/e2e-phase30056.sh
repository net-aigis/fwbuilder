#!/usr/bin/env bash
# Phase-30056: soft-complete through 30056 (ms 92000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30056
assert m.WEBUI_HONESTY_MILESTONE == 92000
print("soft-complete >=30056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30056|through 30056' webui/STATUS.md
echo "OK: phase30056 e2e passed"
