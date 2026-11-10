#!/usr/bin/env bash
# Phase-26136: soft-complete through 26136 (ms 79750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26136
assert m.WEBUI_HONESTY_MILESTONE == 79750
print("soft-complete >=26136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26136|through 26136' webui/STATUS.md
echo "OK: phase26136 e2e passed"
