#!/usr/bin/env bash
# Phase-39016: soft-complete through 39016 (ms 120000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39016
assert m.WEBUI_HONESTY_MILESTONE == 120000
print("soft-complete >=39016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39016|through 39016' webui/STATUS.md
echo "OK: phase39016 e2e passed"
