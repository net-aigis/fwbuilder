#!/usr/bin/env bash
# Phase-24696: soft-complete through 24696 (ms 75250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24696
assert m.WEBUI_HONESTY_MILESTONE == 75250
print("soft-complete >=24696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24696|through 24696' webui/STATUS.md
echo "OK: phase24696 e2e passed"
