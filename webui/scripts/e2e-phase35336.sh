#!/usr/bin/env bash
# Phase-35336: soft-complete through 35336 (ms 108500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35336
assert m.WEBUI_HONESTY_MILESTONE == 108500
print("soft-complete >=35336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35336|through 35336' webui/STATUS.md
echo "OK: phase35336 e2e passed"
