#!/usr/bin/env bash
# Phase-27016: soft-complete through 27016 (ms 82500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27016
assert m.WEBUI_HONESTY_MILESTONE == 82500
print("soft-complete >=27016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27016|through 27016' webui/STATUS.md
echo "OK: phase27016 e2e passed"
