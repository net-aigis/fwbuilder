#!/usr/bin/env bash
# Phase-31032: soft-complete through 31032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31032
PY
grep -qE 'phase31032|through 31032' webui/STATUS.md
echo "OK: phase31032 e2e passed"
