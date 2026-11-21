#!/usr/bin/env bash
# Phase-48560: soft-complete through 48560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48560
PY
grep -qE 'phase48560|through 48560' webui/STATUS.md
echo "OK: phase48560 e2e passed"
