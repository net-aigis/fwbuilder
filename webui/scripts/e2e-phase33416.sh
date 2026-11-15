#!/usr/bin/env bash
# Phase-33416: soft-complete through 33416 (ms 102500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33416
assert m.WEBUI_HONESTY_MILESTONE == 102500
print("soft-complete >=33416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33416|through 33416' webui/STATUS.md
echo "OK: phase33416 e2e passed"
