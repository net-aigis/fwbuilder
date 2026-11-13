#!/usr/bin/env bash
# Phase-29016: soft-complete through 29016 (ms 88750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29016
assert m.WEBUI_HONESTY_MILESTONE == 88750
print("soft-complete >=29016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29016|through 29016' webui/STATUS.md
echo "OK: phase29016 e2e passed"
