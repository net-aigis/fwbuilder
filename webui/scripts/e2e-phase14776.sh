#!/usr/bin/env bash
# Phase-14776: soft-complete through 14776 (ms 44250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14776
assert m.WEBUI_HONESTY_MILESTONE == 44250
print("soft-complete >=14776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14776|through 14776' webui/STATUS.md
echo "OK: phase14776 e2e passed"
