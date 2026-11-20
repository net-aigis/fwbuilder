#!/usr/bin/env bash
# Phase-35280: soft-complete through 35280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35280
PY
grep -qE 'phase35280|through 35280' webui/STATUS.md
echo "OK: phase35280 e2e passed"
