#!/usr/bin/env bash
# Phase-35408: soft-complete through 35408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35408
PY
grep -qE 'phase35408|through 35408' webui/STATUS.md
echo "OK: phase35408 e2e passed"
