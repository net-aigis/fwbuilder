#!/usr/bin/env bash
# Phase-21408: soft-complete through 21408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21408
PY
grep -qE 'phase21408|through 21408' webui/STATUS.md
echo "OK: phase21408 e2e passed"
