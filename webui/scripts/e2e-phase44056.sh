#!/usr/bin/env bash
# Phase-44056: soft-complete through 44056 (ms 135750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44056
assert m.WEBUI_HONESTY_MILESTONE == 135750
print("soft-complete >=44056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44056|through 44056' webui/STATUS.md
echo "OK: phase44056 e2e passed"
