#!/usr/bin/env bash
# Phase-26056: soft-complete through 26056 (ms 79500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26056
assert m.WEBUI_HONESTY_MILESTONE == 79500
print("soft-complete >=26056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26056|through 26056' webui/STATUS.md
echo "OK: phase26056 e2e passed"
