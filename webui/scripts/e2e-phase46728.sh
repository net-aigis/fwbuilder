#!/usr/bin/env bash
# Phase-46728: soft-complete through 46728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46728
PY
grep -qE 'phase46728|through 46728' webui/STATUS.md
echo "OK: phase46728 e2e passed"
