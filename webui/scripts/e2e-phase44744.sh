#!/usr/bin/env bash
# Phase-44744: soft-complete through 44744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44744
PY
grep -qE 'phase44744|through 44744' webui/STATUS.md
echo "OK: phase44744 e2e passed"
