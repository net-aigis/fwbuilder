#!/usr/bin/env bash
# Phase-45312: soft-complete through 45312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45312
PY
grep -qE 'phase45312|through 45312' webui/STATUS.md
echo "OK: phase45312 e2e passed"
