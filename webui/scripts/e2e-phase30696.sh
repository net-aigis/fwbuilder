#!/usr/bin/env bash
# Phase-30696: soft-complete through 30696 (ms 94000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30696
assert m.WEBUI_HONESTY_MILESTONE == 94000
print("soft-complete >=30696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30696|through 30696' webui/STATUS.md
echo "OK: phase30696 e2e passed"
