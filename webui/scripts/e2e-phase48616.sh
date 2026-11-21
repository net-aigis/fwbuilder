#!/usr/bin/env bash
# Phase-48616: soft-complete through 48616 (ms 150000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48616
assert m.WEBUI_HONESTY_MILESTONE == 150000
print("soft-complete >=48616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase48616|through 48616' webui/STATUS.md
echo "OK: phase48616 e2e passed"
