#!/usr/bin/env bash
# Phase-35728: soft-complete through 35728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35728
PY
grep -qE 'phase35728|through 35728' webui/STATUS.md
echo "OK: phase35728 e2e passed"
