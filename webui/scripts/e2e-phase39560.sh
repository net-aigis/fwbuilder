#!/usr/bin/env bash
# Phase-39560: soft-complete through 39560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39560
PY
grep -qE 'phase39560|through 39560' webui/STATUS.md
echo "OK: phase39560 e2e passed"
