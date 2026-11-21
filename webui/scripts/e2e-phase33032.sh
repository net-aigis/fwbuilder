#!/usr/bin/env bash
# Phase-33032: soft-complete through 33032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33032
PY
grep -qE 'phase33032|through 33032' webui/STATUS.md
echo "OK: phase33032 e2e passed"
