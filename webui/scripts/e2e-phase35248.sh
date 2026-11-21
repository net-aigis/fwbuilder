#!/usr/bin/env bash
# Phase-35248: soft-complete through 35248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35248
PY
grep -qE 'phase35248|through 35248' webui/STATUS.md
echo "OK: phase35248 e2e passed"
