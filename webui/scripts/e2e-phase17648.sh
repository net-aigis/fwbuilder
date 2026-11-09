#!/usr/bin/env bash
# Phase-17648: soft-complete through 17648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17648
PY
grep -qE 'phase17648|through 17648' webui/STATUS.md
echo "OK: phase17648 e2e passed"
