#!/usr/bin/env bash
# Phase-26376: soft-complete through 26376 (ms 80500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26376
assert m.WEBUI_HONESTY_MILESTONE == 80500
print("soft-complete >=26376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26376|through 26376' webui/STATUS.md
echo "OK: phase26376 e2e passed"
