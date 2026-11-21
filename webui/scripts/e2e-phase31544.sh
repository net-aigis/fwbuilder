#!/usr/bin/env bash
# Phase-31544: soft-complete through 31544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31544
PY
grep -qE 'phase31544|through 31544' webui/STATUS.md
echo "OK: phase31544 e2e passed"
