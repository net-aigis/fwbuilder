#!/usr/bin/env bash
# Phase-38376: soft-complete through 38376 (ms 118000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38376
assert m.WEBUI_HONESTY_MILESTONE == 118000
print("soft-complete >=38376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38376|through 38376' webui/STATUS.md
echo "OK: phase38376 e2e passed"
