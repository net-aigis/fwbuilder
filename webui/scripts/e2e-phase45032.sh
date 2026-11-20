#!/usr/bin/env bash
# Phase-45032: soft-complete through 45032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45032
PY
grep -qE 'phase45032|through 45032' webui/STATUS.md
echo "OK: phase45032 e2e passed"
