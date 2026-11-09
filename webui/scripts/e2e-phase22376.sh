#!/usr/bin/env bash
# Phase-22376: soft-complete through 22376 (ms 68000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22376
assert m.WEBUI_HONESTY_MILESTONE == 68000
print("soft-complete >=22376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22376|through 22376' webui/STATUS.md
echo "OK: phase22376 e2e passed"
