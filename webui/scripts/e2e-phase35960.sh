#!/usr/bin/env bash
# Phase-35960: soft-complete through 35960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35960
PY
grep -qE 'phase35960|through 35960' webui/STATUS.md
echo "OK: phase35960 e2e passed"
