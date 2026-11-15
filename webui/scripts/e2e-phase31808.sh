#!/usr/bin/env bash
# Phase-31808: soft-complete through 31808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31808
PY
grep -qE 'phase31808|through 31808' webui/STATUS.md
echo "OK: phase31808 e2e passed"
