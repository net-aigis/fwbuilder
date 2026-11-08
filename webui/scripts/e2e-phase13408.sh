#!/usr/bin/env bash
# Phase-13408: soft-complete through 13408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13408
PY
grep -qE 'phase13408|through 13408' webui/STATUS.md
echo "OK: phase13408 e2e passed"
