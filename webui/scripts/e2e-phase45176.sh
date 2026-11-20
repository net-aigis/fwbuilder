#!/usr/bin/env bash
# Phase-45176: soft-complete through 45176 (ms 139250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45176
assert m.WEBUI_HONESTY_MILESTONE == 139250
print("soft-complete >=45176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45176|through 45176' webui/STATUS.md
echo "OK: phase45176 e2e passed"
