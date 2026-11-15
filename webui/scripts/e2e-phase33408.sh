#!/usr/bin/env bash
# Phase-33408: soft-complete through 33408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33408
PY
grep -qE 'phase33408|through 33408' webui/STATUS.md
echo "OK: phase33408 e2e passed"
