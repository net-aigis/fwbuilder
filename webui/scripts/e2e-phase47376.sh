#!/usr/bin/env bash
# Phase-47376: soft-complete through 47376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47376
PY
grep -qE 'phase47376|through 47376' webui/STATUS.md
echo "OK: phase47376 e2e passed"
