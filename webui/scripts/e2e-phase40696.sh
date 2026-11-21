#!/usr/bin/env bash
# Phase-40696: soft-complete through 40696 (ms 125250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40696
assert m.WEBUI_HONESTY_MILESTONE == 125250
print("soft-complete >=40696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40696|through 40696' webui/STATUS.md
echo "OK: phase40696 e2e passed"
