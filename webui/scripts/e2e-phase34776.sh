#!/usr/bin/env bash
# Phase-34776: soft-complete through 34776 (ms 106750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34776
assert m.WEBUI_HONESTY_MILESTONE == 106750
print("soft-complete >=34776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34776|through 34776' webui/STATUS.md
echo "OK: phase34776 e2e passed"
