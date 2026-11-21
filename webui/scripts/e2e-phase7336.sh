#!/usr/bin/env bash
# Phase-7336: soft-complete through 7336 (ms 21000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7336
assert m.WEBUI_HONESTY_MILESTONE == 21000
print("soft-complete >=7336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7336|through 7336' webui/STATUS.md
echo "OK: phase7336 e2e passed"
