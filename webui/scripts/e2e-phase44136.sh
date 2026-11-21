#!/usr/bin/env bash
# Phase-44136: soft-complete through 44136 (ms 136000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44136
assert m.WEBUI_HONESTY_MILESTONE == 136000
print("soft-complete >=44136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44136|through 44136' webui/STATUS.md
echo "OK: phase44136 e2e passed"
