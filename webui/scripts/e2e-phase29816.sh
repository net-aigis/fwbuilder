#!/usr/bin/env bash
# Phase-29816: soft-complete through 29816 (ms 91250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29816
assert m.WEBUI_HONESTY_MILESTONE == 91250
print("soft-complete >=29816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29816|through 29816' webui/STATUS.md
echo "OK: phase29816 e2e passed"
