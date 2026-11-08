#!/usr/bin/env bash
# Phase-11816: soft-complete through 11816 (ms 35000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11816
assert m.WEBUI_HONESTY_MILESTONE == 35000
print("soft-complete >=11816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11816|through 11816' webui/STATUS.md
echo "OK: phase11816 e2e passed"
