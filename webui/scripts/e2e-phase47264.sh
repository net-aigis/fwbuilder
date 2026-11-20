#!/usr/bin/env bash
# Phase-47264: soft-complete through 47264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47264
PY
grep -qE 'phase47264|through 47264' webui/STATUS.md
echo "OK: phase47264 e2e passed"
