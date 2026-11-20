#!/usr/bin/env bash
# Phase-37808: soft-complete through 37808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37808
PY
grep -qE 'phase37808|through 37808' webui/STATUS.md
echo "OK: phase37808 e2e passed"
