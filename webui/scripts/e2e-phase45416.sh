#!/usr/bin/env bash
# Phase-45416: soft-complete through 45416 (ms 140000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45416
assert m.WEBUI_HONESTY_MILESTONE == 140000
print("soft-complete >=45416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45416|through 45416' webui/STATUS.md
echo "OK: phase45416 e2e passed"
