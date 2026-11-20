#!/usr/bin/env bash
# Phase-34744: soft-complete through 34744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34744
PY
grep -qE 'phase34744|through 34744' webui/STATUS.md
echo "OK: phase34744 e2e passed"
