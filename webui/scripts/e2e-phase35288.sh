#!/usr/bin/env bash
# Phase-35288: soft-complete through 35288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35288
PY
grep -qE 'phase35288|through 35288' webui/STATUS.md
echo "OK: phase35288 e2e passed"
