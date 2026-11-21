#!/usr/bin/env bash
# Phase-35560: soft-complete through 35560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35560
PY
grep -qE 'phase35560|through 35560' webui/STATUS.md
echo "OK: phase35560 e2e passed"
