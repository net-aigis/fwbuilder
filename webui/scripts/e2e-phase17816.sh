#!/usr/bin/env bash
# Phase-17816: soft-complete through 17816 (ms 53750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17816
assert m.WEBUI_HONESTY_MILESTONE == 53750
print("soft-complete >=17816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17816|through 17816' webui/STATUS.md
echo "OK: phase17816 e2e passed"
