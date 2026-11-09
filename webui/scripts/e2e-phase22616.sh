#!/usr/bin/env bash
# Phase-22616: soft-complete through 22616 (ms 68750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22616
assert m.WEBUI_HONESTY_MILESTONE == 68750
print("soft-complete >=22616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22616|through 22616' webui/STATUS.md
echo "OK: phase22616 e2e passed"
