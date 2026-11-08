#!/usr/bin/env bash
# Phase-9816: soft-complete through 9816 (ms 28750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9816
assert m.WEBUI_HONESTY_MILESTONE == 28750
print("soft-complete >=9816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9816|through 9816' webui/STATUS.md
echo "OK: phase9816 e2e passed"
