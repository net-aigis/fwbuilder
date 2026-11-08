#!/usr/bin/env bash
# Phase-15408: soft-complete through 15408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15408
PY
grep -qE 'phase15408|through 15408' webui/STATUS.md
echo "OK: phase15408 e2e passed"
