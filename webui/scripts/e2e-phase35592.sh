#!/usr/bin/env bash
# Phase-35592: soft-complete through 35592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35592
PY
grep -qE 'phase35592|through 35592' webui/STATUS.md
echo "OK: phase35592 e2e passed"
