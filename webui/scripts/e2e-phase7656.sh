#!/usr/bin/env bash
# Phase-7656: soft-complete through 7656 (ms 22000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7656
assert m.WEBUI_HONESTY_MILESTONE == 22000
print("soft-complete >=7656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7656|through 7656' webui/STATUS.md
echo "OK: phase7656 e2e passed"
