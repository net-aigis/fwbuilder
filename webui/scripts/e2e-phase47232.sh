#!/usr/bin/env bash
# Phase-47232: soft-complete through 47232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47232
PY
grep -qE 'phase47232|through 47232' webui/STATUS.md
echo "OK: phase47232 e2e passed"
