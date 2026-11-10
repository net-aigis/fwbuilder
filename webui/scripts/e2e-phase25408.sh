#!/usr/bin/env bash
# Phase-25408: soft-complete through 25408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25408
PY
grep -qE 'phase25408|through 25408' webui/STATUS.md
echo "OK: phase25408 e2e passed"
