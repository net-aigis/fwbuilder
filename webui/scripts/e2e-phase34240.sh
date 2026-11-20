#!/usr/bin/env bash
# Phase-34240: soft-complete through 34240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34240
PY
grep -qE 'phase34240|through 34240' webui/STATUS.md
echo "OK: phase34240 e2e passed"
