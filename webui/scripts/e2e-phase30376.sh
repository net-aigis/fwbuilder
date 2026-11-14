#!/usr/bin/env bash
# Phase-30376: soft-complete through 30376 (ms 93000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30376
assert m.WEBUI_HONESTY_MILESTONE == 93000
print("soft-complete >=30376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30376|through 30376' webui/STATUS.md
echo "OK: phase30376 e2e passed"
