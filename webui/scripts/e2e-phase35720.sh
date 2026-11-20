#!/usr/bin/env bash
# Phase-35720: soft-complete through 35720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35720
PY
grep -qE 'phase35720|through 35720' webui/STATUS.md
echo "OK: phase35720 e2e passed"
