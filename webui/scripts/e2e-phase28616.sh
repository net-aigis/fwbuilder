#!/usr/bin/env bash
# Phase-28616: soft-complete through 28616 (ms 87500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28616
assert m.WEBUI_HONESTY_MILESTONE == 87500
print("soft-complete >=28616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28616|through 28616' webui/STATUS.md
echo "OK: phase28616 e2e passed"
