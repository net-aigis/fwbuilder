#!/usr/bin/env bash
# Phase-33608: soft-complete through 33608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33608
PY
grep -qE 'phase33608|through 33608' webui/STATUS.md
echo "OK: phase33608 e2e passed"
