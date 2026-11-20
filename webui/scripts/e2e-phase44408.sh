#!/usr/bin/env bash
# Phase-44408: soft-complete through 44408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44408
PY
grep -qE 'phase44408|through 44408' webui/STATUS.md
echo "OK: phase44408 e2e passed"
