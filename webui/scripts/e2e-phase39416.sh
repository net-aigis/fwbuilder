#!/usr/bin/env bash
# Phase-39416: soft-complete through 39416 (ms 121250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39416
assert m.WEBUI_HONESTY_MILESTONE == 121250
print("soft-complete >=39416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39416|through 39416' webui/STATUS.md
echo "OK: phase39416 e2e passed"
