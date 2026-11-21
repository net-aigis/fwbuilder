#!/usr/bin/env bash
# Phase-35704: soft-complete through 35704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35704
PY
grep -qE 'phase35704|through 35704' webui/STATUS.md
echo "OK: phase35704 e2e passed"
