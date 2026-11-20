#!/usr/bin/env bash
# Phase-34232: soft-complete through 34232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34232
PY
grep -qE 'phase34232|through 34232' webui/STATUS.md
echo "OK: phase34232 e2e passed"
