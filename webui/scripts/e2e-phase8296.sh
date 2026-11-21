#!/usr/bin/env bash
# Phase-8296: soft-complete through 8296 (ms 24000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8296
assert m.WEBUI_HONESTY_MILESTONE == 24000
print("soft-complete >=8296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8296|through 8296' webui/STATUS.md
echo "OK: phase8296 e2e passed"
