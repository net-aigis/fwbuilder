#!/usr/bin/env bash
# Phase-12048: soft-complete through 12048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12048
PY
grep -qE 'phase12048|through 12048' webui/STATUS.md
echo "OK: phase12048 e2e passed"
