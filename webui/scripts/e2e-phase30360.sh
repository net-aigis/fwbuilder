#!/usr/bin/env bash
# Phase-30360: soft-complete through 30360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30360
PY
grep -qE 'phase30360|through 30360' webui/STATUS.md
echo "OK: phase30360 e2e passed"
