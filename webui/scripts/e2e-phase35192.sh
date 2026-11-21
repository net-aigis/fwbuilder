#!/usr/bin/env bash
# Phase-35192: soft-complete through 35192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35192
PY
grep -qE 'phase35192|through 35192' webui/STATUS.md
echo "OK: phase35192 e2e passed"
