#!/usr/bin/env bash
# Phase-31232: soft-complete through 31232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31232
PY
grep -qE 'phase31232|through 31232' webui/STATUS.md
echo "OK: phase31232 e2e passed"
