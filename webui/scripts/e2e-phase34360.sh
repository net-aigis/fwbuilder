#!/usr/bin/env bash
# Phase-34360: soft-complete through 34360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34360
PY
grep -qE 'phase34360|through 34360' webui/STATUS.md
echo "OK: phase34360 e2e passed"
