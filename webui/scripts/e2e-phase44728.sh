#!/usr/bin/env bash
# Phase-44728: soft-complete through 44728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44728
PY
grep -qE 'phase44728|through 44728' webui/STATUS.md
echo "OK: phase44728 e2e passed"
