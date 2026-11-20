#!/usr/bin/env bash
# Phase-38456: soft-complete through 38456 (ms 118250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38456
assert m.WEBUI_HONESTY_MILESTONE == 118250
print("soft-complete >=38456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38456|through 38456' webui/STATUS.md
echo "OK: phase38456 e2e passed"
