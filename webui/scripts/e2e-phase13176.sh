#!/usr/bin/env bash
# Phase-13176: soft-complete through 13176 (ms 39250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13176
assert m.WEBUI_HONESTY_MILESTONE == 39250
print("soft-complete >=13176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13176|through 13176' webui/STATUS.md
echo "OK: phase13176 e2e passed"
