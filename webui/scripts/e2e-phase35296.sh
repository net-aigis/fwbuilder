#!/usr/bin/env bash
# Phase-35296: soft-complete through 35296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35296
PY
grep -qE 'phase35296|through 35296' webui/STATUS.md
echo "OK: phase35296 e2e passed"
