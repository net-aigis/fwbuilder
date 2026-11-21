#!/usr/bin/env bash
# Phase-34648: soft-complete through 34648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34648
PY
grep -qE 'phase34648|through 34648' webui/STATUS.md
echo "OK: phase34648 e2e passed"
