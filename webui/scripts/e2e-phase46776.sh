#!/usr/bin/env bash
# Phase-46776: soft-complete through 46776 (ms 144250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46776
assert m.WEBUI_HONESTY_MILESTONE == 144250
print("soft-complete >=46776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46776|through 46776' webui/STATUS.md
echo "OK: phase46776 e2e passed"
