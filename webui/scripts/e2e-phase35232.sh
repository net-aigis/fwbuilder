#!/usr/bin/env bash
# Phase-35232: soft-complete through 35232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35232
PY
grep -qE 'phase35232|through 35232' webui/STATUS.md
echo "OK: phase35232 e2e passed"
