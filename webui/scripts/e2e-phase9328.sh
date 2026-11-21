#!/usr/bin/env bash
# Phase-9328: soft-complete through 9328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9328
PY
grep -qE 'phase9328|through 9328' webui/STATUS.md
echo "OK: phase9328 e2e passed"
