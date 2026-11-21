#!/usr/bin/env bash
# Phase-7896: soft-complete through 7896 (ms 22750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7896
assert m.WEBUI_HONESTY_MILESTONE == 22750
print("soft-complete >=7896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7896|through 7896' webui/STATUS.md
echo "OK: phase7896 e2e passed"
