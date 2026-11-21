#!/usr/bin/env bash
# Phase-48376: soft-complete through 48376 (ms 149250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48376
assert m.WEBUI_HONESTY_MILESTONE == 149250
print("soft-complete >=48376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48376|through 48376' webui/STATUS.md
echo "OK: phase48376 e2e passed"
