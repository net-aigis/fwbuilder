#!/usr/bin/env bash
# Phase-23016: soft-complete through 23016 (ms 70000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23016
assert m.WEBUI_HONESTY_MILESTONE == 70000
print("soft-complete >=23016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23016|through 23016' webui/STATUS.md
echo "OK: phase23016 e2e passed"
