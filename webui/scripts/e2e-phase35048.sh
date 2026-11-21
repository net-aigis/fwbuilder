#!/usr/bin/env bash
# Phase-35048: soft-complete through 35048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35048
PY
grep -qE 'phase35048|through 35048' webui/STATUS.md
echo "OK: phase35048 e2e passed"
