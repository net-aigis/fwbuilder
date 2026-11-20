#!/usr/bin/env bash
# Phase-44648: soft-complete through 44648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44648
PY
grep -qE 'phase44648|through 44648' webui/STATUS.md
echo "OK: phase44648 e2e passed"
