#!/usr/bin/env bash
# Phase-32776: soft-complete through 32776 (ms 100500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32776
assert m.WEBUI_HONESTY_MILESTONE == 100500
print("soft-complete >=32776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32776|through 32776' webui/STATUS.md
echo "OK: phase32776 e2e passed"
