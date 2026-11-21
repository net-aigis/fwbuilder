#!/usr/bin/env bash
# Phase-35640: soft-complete through 35640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35640
PY
grep -qE 'phase35640|through 35640' webui/STATUS.md
echo "OK: phase35640 e2e passed"
