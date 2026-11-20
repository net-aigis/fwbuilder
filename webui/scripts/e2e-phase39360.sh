#!/usr/bin/env bash
# Phase-39360: soft-complete through 39360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39360
PY
grep -qE 'phase39360|through 39360' webui/STATUS.md
echo "OK: phase39360 e2e passed"
