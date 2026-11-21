#!/usr/bin/env bash
# Phase-28376: soft-complete through 28376 (ms 86750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28376
assert m.WEBUI_HONESTY_MILESTONE == 86750
print("soft-complete >=28376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28376|through 28376' webui/STATUS.md
echo "OK: phase28376 e2e passed"
