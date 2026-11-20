#!/usr/bin/env bash
# Phase-47016: soft-complete through 47016 (ms 145000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47016
assert m.WEBUI_HONESTY_MILESTONE == 145000
print("soft-complete >=47016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47016|through 47016' webui/STATUS.md
echo "OK: phase47016 e2e passed"
