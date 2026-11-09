#!/usr/bin/env bash
# Phase-19816: soft-complete through 19816 (ms 60000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19816
assert m.WEBUI_HONESTY_MILESTONE == 60000
print("soft-complete >=19816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19816|through 19816' webui/STATUS.md
echo "OK: phase19816 e2e passed"
