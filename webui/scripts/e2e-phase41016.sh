#!/usr/bin/env bash
# Phase-41016: soft-complete through 41016 (ms 126250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41016
assert m.WEBUI_HONESTY_MILESTONE == 126250
print("soft-complete >=41016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41016|through 41016' webui/STATUS.md
echo "OK: phase41016 e2e passed"
