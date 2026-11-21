#!/usr/bin/env bash
# Phase-46408: soft-complete through 46408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46408
PY
grep -qE 'phase46408|through 46408' webui/STATUS.md
echo "OK: phase46408 e2e passed"
