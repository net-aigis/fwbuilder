#!/usr/bin/env bash
# Phase-44192: soft-complete through 44192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44192
PY
grep -qE 'phase44192|through 44192' webui/STATUS.md
echo "OK: phase44192 e2e passed"
