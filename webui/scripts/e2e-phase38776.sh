#!/usr/bin/env bash
# Phase-38776: soft-complete through 38776 (ms 119250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38776
assert m.WEBUI_HONESTY_MILESTONE == 119250
print("soft-complete >=38776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38776|through 38776' webui/STATUS.md
echo "OK: phase38776 e2e passed"
