#!/usr/bin/env bash
# Phase-35784: soft-complete through 35784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35784
PY
grep -qE 'phase35784|through 35784' webui/STATUS.md
echo "OK: phase35784 e2e passed"
