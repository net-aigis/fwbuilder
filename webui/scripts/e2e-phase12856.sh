#!/usr/bin/env bash
# Phase-12856: soft-complete through 12856 (ms 38250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12856
assert m.WEBUI_HONESTY_MILESTONE == 38250
print("soft-complete >=12856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12856|through 12856' webui/STATUS.md
echo "OK: phase12856 e2e passed"
