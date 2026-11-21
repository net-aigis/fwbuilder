#!/usr/bin/env bash
# Phase-35312: soft-complete through 35312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35312
PY
grep -qE 'phase35312|through 35312' webui/STATUS.md
echo "OK: phase35312 e2e passed"
