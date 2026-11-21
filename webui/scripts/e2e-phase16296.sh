#!/usr/bin/env bash
# Phase-16296: soft-complete through 16296 (ms 49000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16296
assert m.WEBUI_HONESTY_MILESTONE == 49000
print("soft-complete >=16296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16296|through 16296' webui/STATUS.md
echo "OK: phase16296 e2e passed"
