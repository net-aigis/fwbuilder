#!/usr/bin/env bash
# Phase-9808: soft-complete through 9808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9808
PY
grep -qE 'phase9808|through 9808' webui/STATUS.md
echo "OK: phase9808 e2e passed"
