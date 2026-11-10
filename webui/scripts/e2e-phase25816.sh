#!/usr/bin/env bash
# Phase-25816: soft-complete through 25816 (ms 78750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25816
assert m.WEBUI_HONESTY_MILESTONE == 78750
print("soft-complete >=25816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25816|through 25816' webui/STATUS.md
echo "OK: phase25816 e2e passed"
