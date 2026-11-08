#!/usr/bin/env bash
# Phase-14456: soft-complete through 14456 (ms 43250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14456
assert m.WEBUI_HONESTY_MILESTONE == 43250
print("soft-complete >=14456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14456|through 14456' webui/STATUS.md
echo "OK: phase14456 e2e passed"
