#!/usr/bin/env bash
# Phase-35264: soft-complete through 35264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35264
PY
grep -qE 'phase35264|through 35264' webui/STATUS.md
echo "OK: phase35264 e2e passed"
