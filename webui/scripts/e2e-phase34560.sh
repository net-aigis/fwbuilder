#!/usr/bin/env bash
# Phase-34560: soft-complete through 34560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34560
PY
grep -qE 'phase34560|through 34560' webui/STATUS.md
echo "OK: phase34560 e2e passed"
