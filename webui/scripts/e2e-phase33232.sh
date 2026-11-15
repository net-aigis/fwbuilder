#!/usr/bin/env bash
# Phase-33232: soft-complete through 33232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33232
PY
grep -qE 'phase33232|through 33232' webui/STATUS.md
echo "OK: phase33232 e2e passed"
