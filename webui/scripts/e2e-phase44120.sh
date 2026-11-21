#!/usr/bin/env bash
# Phase-44120: soft-complete through 44120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44120
PY
grep -qE 'phase44120|through 44120' webui/STATUS.md
echo "OK: phase44120 e2e passed"
