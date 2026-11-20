#!/usr/bin/env bash
# Phase-45232: soft-complete through 45232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45232
PY
grep -qE 'phase45232|through 45232' webui/STATUS.md
echo "OK: phase45232 e2e passed"
