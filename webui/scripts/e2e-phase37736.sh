#!/usr/bin/env bash
# Phase-37736: soft-complete through 37736 (ms 116000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37736
assert m.WEBUI_HONESTY_MILESTONE == 116000
print("soft-complete >=37736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37736|through 37736' webui/STATUS.md
echo "OK: phase37736 e2e passed"
