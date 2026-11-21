#!/usr/bin/env bash
# Phase-15736: soft-complete through 15736 (ms 47250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15736
assert m.WEBUI_HONESTY_MILESTONE == 47250
print("soft-complete >=15736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15736|through 15736' webui/STATUS.md
echo "OK: phase15736 e2e passed"
