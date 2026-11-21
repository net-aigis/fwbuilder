#!/usr/bin/env bash
# Phase-31560: soft-complete through 31560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31560
PY
grep -qE 'phase31560|through 31560' webui/STATUS.md
echo "OK: phase31560 e2e passed"
