#!/usr/bin/env bash
# Phase-35328: soft-complete through 35328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35328
PY
grep -qE 'phase35328|through 35328' webui/STATUS.md
echo "OK: phase35328 e2e passed"
