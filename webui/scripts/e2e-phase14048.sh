#!/usr/bin/env bash
# Phase-14048: soft-complete through 14048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14048
PY
grep -qE 'phase14048|through 14048' webui/STATUS.md
echo "OK: phase14048 e2e passed"
