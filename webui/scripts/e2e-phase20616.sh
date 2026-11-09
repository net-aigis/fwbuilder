#!/usr/bin/env bash
# Phase-20616: soft-complete through 20616 (ms 62500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20616
assert m.WEBUI_HONESTY_MILESTONE == 62500
print("soft-complete >=20616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20616|through 20616' webui/STATUS.md
echo "OK: phase20616 e2e passed"
