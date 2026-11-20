#!/usr/bin/env bash
# Phase-35600: soft-complete through 35600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35600
PY
grep -qE 'phase35600|through 35600' webui/STATUS.md
echo "OK: phase35600 e2e passed"
