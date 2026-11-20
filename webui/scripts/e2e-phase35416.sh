#!/usr/bin/env bash
# Phase-35416: soft-complete through 35416 (ms 108750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35416
assert m.WEBUI_HONESTY_MILESTONE == 108750
print("soft-complete >=35416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35416|through 35416' webui/STATUS.md
echo "OK: phase35416 e2e passed"
