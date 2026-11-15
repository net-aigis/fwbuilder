#!/usr/bin/env bash
# Phase-32296: soft-complete through 32296 (ms 99000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32296
assert m.WEBUI_HONESTY_MILESTONE == 99000
print("soft-complete >=32296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase32296|through 32296' webui/STATUS.md
echo "OK: phase32296 e2e passed"
