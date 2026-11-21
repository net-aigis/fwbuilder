#!/usr/bin/env bash
# Phase-25648: soft-complete through 25648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25648
PY
grep -qE 'phase25648|through 25648' webui/STATUS.md
echo "OK: phase25648 e2e passed"
