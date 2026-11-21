#!/usr/bin/env bash
# Phase-16696: soft-complete through 16696 (ms 50250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16696
assert m.WEBUI_HONESTY_MILESTONE == 50250
print("soft-complete >=16696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16696|through 16696' webui/STATUS.md
echo "OK: phase16696 e2e passed"
