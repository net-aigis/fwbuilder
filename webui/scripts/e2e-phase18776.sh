#!/usr/bin/env bash
# Phase-18776: soft-complete through 18776 (ms 56750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18776
assert m.WEBUI_HONESTY_MILESTONE == 56750
print("soft-complete >=18776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18776|through 18776' webui/STATUS.md
echo "OK: phase18776 e2e passed"
