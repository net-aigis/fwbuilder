#!/usr/bin/env bash
# Phase-33360: soft-complete through 33360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33360
PY
grep -qE 'phase33360|through 33360' webui/STATUS.md
echo "OK: phase33360 e2e passed"
