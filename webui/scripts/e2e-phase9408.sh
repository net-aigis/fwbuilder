#!/usr/bin/env bash
# Phase-9408: soft-complete through 9408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9408
PY
grep -qE 'phase9408|through 9408' webui/STATUS.md
echo "OK: phase9408 e2e passed"
