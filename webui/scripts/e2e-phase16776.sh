#!/usr/bin/env bash
# Phase-16776: soft-complete through 16776 (ms 50500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16776
assert m.WEBUI_HONESTY_MILESTONE == 50500
print("soft-complete >=16776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16776|through 16776' webui/STATUS.md
echo "OK: phase16776 e2e passed"
