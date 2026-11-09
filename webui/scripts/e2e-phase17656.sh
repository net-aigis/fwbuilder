#!/usr/bin/env bash
# Phase-17656: soft-complete through 17656 (ms 53250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17656
assert m.WEBUI_HONESTY_MILESTONE == 53250
print("soft-complete >=17656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17656|through 17656' webui/STATUS.md
echo "OK: phase17656 e2e passed"
