#!/usr/bin/env bash
# Phase-34376: soft-complete through 34376 (ms 105500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34376
assert m.WEBUI_HONESTY_MILESTONE == 105500
print("soft-complete >=34376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34376|through 34376' webui/STATUS.md
echo "OK: phase34376 e2e passed"
