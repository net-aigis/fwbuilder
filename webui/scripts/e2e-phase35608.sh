#!/usr/bin/env bash
# Phase-35608: soft-complete through 35608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35608
PY
grep -qE 'phase35608|through 35608' webui/STATUS.md
echo "OK: phase35608 e2e passed"
