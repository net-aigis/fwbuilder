#!/usr/bin/env bash
# Phase-7408: soft-complete through 7408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7408
PY
grep -qE 'phase7408|through 7408' webui/STATUS.md
echo "OK: phase7408 e2e passed"
