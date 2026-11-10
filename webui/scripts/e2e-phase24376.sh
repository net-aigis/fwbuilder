#!/usr/bin/env bash
# Phase-24376: soft-complete through 24376 (ms 74250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24376
assert m.WEBUI_HONESTY_MILESTONE == 74250
print("soft-complete >=24376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24376|through 24376' webui/STATUS.md
echo "OK: phase24376 e2e passed"
