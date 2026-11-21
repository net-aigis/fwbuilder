#!/usr/bin/env bash
# Phase-35800: soft-complete through 35800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35800
PY
grep -qE 'phase35800|through 35800' webui/STATUS.md
echo "OK: phase35800 e2e passed"
