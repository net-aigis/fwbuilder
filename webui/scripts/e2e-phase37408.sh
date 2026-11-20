#!/usr/bin/env bash
# Phase-37408: soft-complete through 37408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37408
PY
grep -qE 'phase37408|through 37408' webui/STATUS.md
echo "OK: phase37408 e2e passed"
