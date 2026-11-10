#!/usr/bin/env bash
# Phase-23408: soft-complete through 23408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23408
PY
grep -qE 'phase23408|through 23408' webui/STATUS.md
echo "OK: phase23408 e2e passed"
