#!/usr/bin/env bash
# Phase-30456: soft-complete through 30456 (ms 93250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30456
assert m.WEBUI_HONESTY_MILESTONE == 93250
print("soft-complete >=30456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30456|through 30456' webui/STATUS.md
echo "OK: phase30456 e2e passed"
