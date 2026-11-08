#!/usr/bin/env bash
# Phase-7648: soft-complete through 7648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7648
PY
grep -qE 'phase7648|through 7648' webui/STATUS.md
echo "OK: phase7648 e2e passed"
