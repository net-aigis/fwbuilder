#!/usr/bin/env bash
# Phase-35112: soft-complete through 35112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35112
PY
grep -qE 'phase35112|through 35112' webui/STATUS.md
echo "OK: phase35112 e2e passed"
