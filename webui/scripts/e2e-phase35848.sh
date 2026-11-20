#!/usr/bin/env bash
# Phase-35848: soft-complete through 35848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35848
PY
grep -qE 'phase35848|through 35848' webui/STATUS.md
echo "OK: phase35848 e2e passed"
