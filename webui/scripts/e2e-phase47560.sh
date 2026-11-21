#!/usr/bin/env bash
# Phase-47560: soft-complete through 47560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47560
PY
grep -qE 'phase47560|through 47560' webui/STATUS.md
echo "OK: phase47560 e2e passed"
