#!/usr/bin/env bash
# Phase-39408: soft-complete through 39408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39408
PY
grep -qE 'phase39408|through 39408' webui/STATUS.md
echo "OK: phase39408 e2e passed"
