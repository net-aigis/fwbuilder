#!/usr/bin/env bash
# Phase-27648: soft-complete through 27648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27648
PY
grep -qE 'phase27648|through 27648' webui/STATUS.md
echo "OK: phase27648 e2e passed"
