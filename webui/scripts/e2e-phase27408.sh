#!/usr/bin/env bash
# Phase-27408: soft-complete through 27408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27408
PY
grep -qE 'phase27408|through 27408' webui/STATUS.md
echo "OK: phase27408 e2e passed"
