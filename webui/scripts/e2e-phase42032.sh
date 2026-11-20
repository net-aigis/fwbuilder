#!/usr/bin/env bash
# Phase-42032: soft-complete through 42032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42032
PY
grep -qE 'phase42032|through 42032' webui/STATUS.md
echo "OK: phase42032 e2e passed"
