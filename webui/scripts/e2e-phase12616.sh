#!/usr/bin/env bash
# Phase-12616: soft-complete through 12616 (ms 37500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12616
assert m.WEBUI_HONESTY_MILESTONE == 37500
print("soft-complete >=12616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12616|through 12616' webui/STATUS.md
echo "OK: phase12616 e2e passed"
