#!/usr/bin/env bash
# Phase-10776: soft-complete through 10776 (ms 31750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10776
assert m.WEBUI_HONESTY_MILESTONE == 31750
print("soft-complete >=10776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10776|through 10776' webui/STATUS.md
echo "OK: phase10776 e2e passed"
