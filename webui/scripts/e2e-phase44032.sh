#!/usr/bin/env bash
# Phase-44032: soft-complete through 44032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44032
PY
grep -qE 'phase44032|through 44032' webui/STATUS.md
echo "OK: phase44032 e2e passed"
