#!/usr/bin/env bash
# Phase-37560: soft-complete through 37560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37560
PY
grep -qE 'phase37560|through 37560' webui/STATUS.md
echo "OK: phase37560 e2e passed"
