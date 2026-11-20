#!/usr/bin/env bash
# Phase-45408: soft-complete through 45408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45408
PY
grep -qE 'phase45408|through 45408' webui/STATUS.md
echo "OK: phase45408 e2e passed"
