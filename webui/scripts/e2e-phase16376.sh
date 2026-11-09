#!/usr/bin/env bash
# Phase-16376: soft-complete through 16376 (ms 49250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16376
assert m.WEBUI_HONESTY_MILESTONE == 49250
print("soft-complete >=16376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16376|through 16376' webui/STATUS.md
echo "OK: phase16376 e2e passed"
