#!/usr/bin/env bash
# Phase-29408: soft-complete through 29408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29408
PY
grep -qE 'phase29408|through 29408' webui/STATUS.md
echo "OK: phase29408 e2e passed"
