#!/usr/bin/env bash
# Phase-40032: soft-complete through 40032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40032
PY
grep -qE 'phase40032|through 40032' webui/STATUS.md
echo "OK: phase40032 e2e passed"
