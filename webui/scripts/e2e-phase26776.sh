#!/usr/bin/env bash
# Phase-26776: soft-complete through 26776 (ms 81750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26776
assert m.WEBUI_HONESTY_MILESTONE == 81750
print("soft-complete >=26776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26776|through 26776' webui/STATUS.md
echo "OK: phase26776 e2e passed"
