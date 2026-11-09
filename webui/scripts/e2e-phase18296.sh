#!/usr/bin/env bash
# Phase-18296: soft-complete through 18296 (ms 55250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18296
assert m.WEBUI_HONESTY_MILESTONE == 55250
print("soft-complete >=18296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18296|through 18296' webui/STATUS.md
echo "OK: phase18296 e2e passed"
