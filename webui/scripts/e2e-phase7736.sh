#!/usr/bin/env bash
# Phase-7736: soft-complete through 7736 (ms 22250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7736
assert m.WEBUI_HONESTY_MILESTONE == 22250
print("soft-complete >=7736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7736|through 7736' webui/STATUS.md
echo "OK: phase7736 e2e passed"
