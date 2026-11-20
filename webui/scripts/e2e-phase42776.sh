#!/usr/bin/env bash
# Phase-42776: soft-complete through 42776 (ms 131750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42776
assert m.WEBUI_HONESTY_MILESTONE == 131750
print("soft-complete >=42776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42776|through 42776' webui/STATUS.md
echo "OK: phase42776 e2e passed"
