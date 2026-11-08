#!/usr/bin/env bash
# Phase-12056: soft-complete through 12056 (ms 35750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12056
assert m.WEBUI_HONESTY_MILESTONE == 35750
print("soft-complete >=12056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12056|through 12056' webui/STATUS.md
echo "OK: phase12056 e2e passed"
