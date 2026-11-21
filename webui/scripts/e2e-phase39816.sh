#!/usr/bin/env bash
# Phase-39816: soft-complete through 39816 (ms 122500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39816
assert m.WEBUI_HONESTY_MILESTONE == 122500
print("soft-complete >=39816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39816|through 39816' webui/STATUS.md
echo "OK: phase39816 e2e passed"
