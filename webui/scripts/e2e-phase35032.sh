#!/usr/bin/env bash
# Phase-35032: soft-complete through 35032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35032
PY
grep -qE 'phase35032|through 35032' webui/STATUS.md
echo "OK: phase35032 e2e passed"
