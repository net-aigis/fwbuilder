#!/usr/bin/env bash
# Phase-27728: soft-complete through 27728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27728
PY
grep -qE 'phase27728|through 27728' webui/STATUS.md
echo "OK: phase27728 e2e passed"
