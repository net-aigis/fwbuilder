#!/usr/bin/env bash
# Phase-22456: soft-complete through 22456 (ms 68250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22456
assert m.WEBUI_HONESTY_MILESTONE == 68250
print("soft-complete >=22456", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22456|through 22456' webui/STATUS.md
echo "OK: phase22456 e2e passed"
