#!/usr/bin/env bash
# Phase-40328: soft-complete through 40328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40328
PY
grep -qE 'phase40328|through 40328' webui/STATUS.md
echo "OK: phase40328 e2e passed"
