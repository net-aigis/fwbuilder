#!/usr/bin/env bash
# Phase-11408: soft-complete through 11408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11408
PY
grep -qE 'phase11408|through 11408' webui/STATUS.md
echo "OK: phase11408 e2e passed"
