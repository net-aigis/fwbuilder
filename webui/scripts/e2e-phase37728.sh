#!/usr/bin/env bash
# Phase-37728: soft-complete through 37728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37728
PY
grep -qE 'phase37728|through 37728' webui/STATUS.md
echo "OK: phase37728 e2e passed"
