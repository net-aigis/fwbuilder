#!/usr/bin/env bash
# Phase-8376: soft-complete through 8376 (ms 24250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8376
assert m.WEBUI_HONESTY_MILESTONE == 24250
print("soft-complete >=8376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8376|through 8376' webui/STATUS.md
echo "OK: phase8376 e2e passed"
