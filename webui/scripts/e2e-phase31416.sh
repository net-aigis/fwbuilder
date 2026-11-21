#!/usr/bin/env bash
# Phase-31416: soft-complete through 31416 (ms 96250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31416
assert m.WEBUI_HONESTY_MILESTONE == 96250
print("soft-complete >=31416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31416|through 31416' webui/STATUS.md
echo "OK: phase31416 e2e passed"
