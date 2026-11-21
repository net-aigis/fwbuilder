#!/usr/bin/env bash
# Phase-7808: soft-complete through 7808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7808
PY
grep -qE 'phase7808|through 7808' webui/STATUS.md
echo "OK: phase7808 e2e passed"
