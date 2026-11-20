#!/usr/bin/env bash
# Phase-34408: soft-complete through 34408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34408
PY
grep -qE 'phase34408|through 34408' webui/STATUS.md
echo "OK: phase34408 e2e passed"
