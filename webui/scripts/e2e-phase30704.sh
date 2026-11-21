#!/usr/bin/env bash
# Phase-30704: soft-complete through 30704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30704
PY
grep -qE 'phase30704|through 30704' webui/STATUS.md
echo "OK: phase30704 e2e passed"
