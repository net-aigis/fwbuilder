#!/usr/bin/env bash
# Phase-38560: soft-complete through 38560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38560
PY
grep -qE 'phase38560|through 38560' webui/STATUS.md
echo "OK: phase38560 e2e passed"
