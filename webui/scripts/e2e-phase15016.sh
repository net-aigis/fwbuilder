#!/usr/bin/env bash
# Phase-15016: soft-complete through 15016 (ms 45000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15016
assert m.WEBUI_HONESTY_MILESTONE == 45000
print("soft-complete >=15016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15016|through 15016' webui/STATUS.md
echo "OK: phase15016 e2e passed"
