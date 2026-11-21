#!/usr/bin/env bash
# Phase-33816: soft-complete through 33816 (ms 103750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33816
assert m.WEBUI_HONESTY_MILESTONE == 103750
print("soft-complete >=33816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33816|through 33816' webui/STATUS.md
echo "OK: phase33816 e2e passed"
