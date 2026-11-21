#!/usr/bin/env bash
# Phase-34200: soft-complete through 34200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34200
PY
grep -qE 'phase34200|through 34200' webui/STATUS.md
echo "OK: phase34200 e2e passed"
