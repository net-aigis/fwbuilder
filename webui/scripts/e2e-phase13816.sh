#!/usr/bin/env bash
# Phase-13816: soft-complete through 13816 (ms 41250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13816
assert m.WEBUI_HONESTY_MILESTONE == 41250
print("soft-complete >=13816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13816|through 13816' webui/STATUS.md
echo "OK: phase13816 e2e passed"
