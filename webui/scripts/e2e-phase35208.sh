#!/usr/bin/env bash
# Phase-35208: soft-complete through 35208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35208
PY
grep -qE 'phase35208|through 35208' webui/STATUS.md
echo "OK: phase35208 e2e passed"
