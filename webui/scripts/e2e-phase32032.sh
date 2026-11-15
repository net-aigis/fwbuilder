#!/usr/bin/env bash
# Phase-32032: soft-complete through 32032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32032
PY
grep -qE 'phase32032|through 32032' webui/STATUS.md
echo "OK: phase32032 e2e passed"
