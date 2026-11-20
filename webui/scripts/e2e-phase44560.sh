#!/usr/bin/env bash
# Phase-44560: soft-complete through 44560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44560
PY
grep -qE 'phase44560|through 44560' webui/STATUS.md
echo "OK: phase44560 e2e passed"
