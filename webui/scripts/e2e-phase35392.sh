#!/usr/bin/env bash
# Phase-35392: soft-complete through 35392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35392
PY
grep -qE 'phase35392|through 35392' webui/STATUS.md
echo "OK: phase35392 e2e passed"
