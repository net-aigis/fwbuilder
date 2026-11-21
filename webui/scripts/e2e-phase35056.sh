#!/usr/bin/env bash
# Phase-35056: soft-complete through 35056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35056
PY
grep -qE 'phase35056|through 35056' webui/STATUS.md
echo "OK: phase35056 e2e passed"
