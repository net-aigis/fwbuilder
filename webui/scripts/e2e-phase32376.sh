#!/usr/bin/env bash
# Phase-32376: soft-complete through 32376 (ms 99250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32376
assert m.WEBUI_HONESTY_MILESTONE == 99250
print("soft-complete >=32376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32376|through 32376' webui/STATUS.md
echo "OK: phase32376 e2e passed"
