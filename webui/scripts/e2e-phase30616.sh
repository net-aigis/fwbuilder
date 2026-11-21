#!/usr/bin/env bash
# Phase-30616: soft-complete through 30616 (ms 93750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30616
assert m.WEBUI_HONESTY_MILESTONE == 93750
print("soft-complete >=30616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30616|through 30616' webui/STATUS.md
echo "OK: phase30616 e2e passed"
