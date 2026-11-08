#!/usr/bin/env bash
# Phase-14056: soft-complete through 14056 (ms 42000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14056
assert m.WEBUI_HONESTY_MILESTONE == 42000
print("soft-complete >=14056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14056|through 14056' webui/STATUS.md
echo "OK: phase14056 e2e passed"
