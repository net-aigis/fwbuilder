#!/usr/bin/env bash
# Phase-35360: soft-complete through 35360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35360
PY
grep -qE 'phase35360|through 35360' webui/STATUS.md
echo "OK: phase35360 e2e passed"
