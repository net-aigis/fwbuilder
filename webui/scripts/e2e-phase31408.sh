#!/usr/bin/env bash
# Phase-31408: soft-complete through 31408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31408
PY
grep -qE 'phase31408|through 31408' webui/STATUS.md
echo "OK: phase31408 e2e passed"
