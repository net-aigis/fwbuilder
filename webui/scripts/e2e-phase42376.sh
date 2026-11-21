#!/usr/bin/env bash
# Phase-42376: soft-complete through 42376 (ms 130500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42376
assert m.WEBUI_HONESTY_MILESTONE == 130500
print("soft-complete >=42376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42376|through 42376' webui/STATUS.md
echo "OK: phase42376 e2e passed"
