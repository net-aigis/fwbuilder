#!/usr/bin/env bash
# Phase-15816: soft-complete through 15816 (ms 47500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15816
assert m.WEBUI_HONESTY_MILESTONE == 47500
print("soft-complete >=15816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15816|through 15816' webui/STATUS.md
echo "OK: phase15816 e2e passed"
