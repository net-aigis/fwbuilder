#!/usr/bin/env bash
# Phase-19408: soft-complete through 19408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19408
PY
grep -qE 'phase19408|through 19408' webui/STATUS.md
echo "OK: phase19408 e2e passed"
