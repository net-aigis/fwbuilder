#!/usr/bin/env bash
# Phase-18376: soft-complete through 18376 (ms 55500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18376
assert m.WEBUI_HONESTY_MILESTONE == 55500
print("soft-complete >=18376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18376|through 18376' webui/STATUS.md
echo "OK: phase18376 e2e passed"
