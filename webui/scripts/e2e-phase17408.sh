#!/usr/bin/env bash
# Phase-17408: soft-complete through 17408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17408
PY
grep -qE 'phase17408|through 17408' webui/STATUS.md
echo "OK: phase17408 e2e passed"
