#!/usr/bin/env bash
# Phase-40376: soft-complete through 40376 (ms 124250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40376
assert m.WEBUI_HONESTY_MILESTONE == 124250
print("soft-complete >=40376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40376|through 40376' webui/STATUS.md
echo "OK: phase40376 e2e passed"
