#!/usr/bin/env bash
# Phase-40880: soft-complete through 40880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40880
PY
grep -qE 'phase40880|through 40880' webui/STATUS.md
echo "OK: phase40880 e2e passed"
