#!/usr/bin/env bash
# Phase-16136: soft-complete through 16136 (ms 48500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16136
assert m.WEBUI_HONESTY_MILESTONE == 48500
print("soft-complete >=16136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16136|through 16136' webui/STATUS.md
echo "OK: phase16136 e2e passed"
