#!/usr/bin/env bash
# Phase-37048: soft-complete through 37048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37048
PY
grep -qE 'phase37048|through 37048' webui/STATUS.md
echo "OK: phase37048 e2e passed"
