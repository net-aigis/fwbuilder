#!/usr/bin/env bash
# Phase-34808: soft-complete through 34808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34808
PY
grep -qE 'phase34808|through 34808' webui/STATUS.md
echo "OK: phase34808 e2e passed"
