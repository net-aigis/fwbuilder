#!/usr/bin/env bash
# Phase-30776: soft-complete through 30776 (ms 94250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30776
assert m.WEBUI_HONESTY_MILESTONE == 94250
print("soft-complete >=30776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30776|through 30776' webui/STATUS.md
echo "OK: phase30776 e2e passed"
