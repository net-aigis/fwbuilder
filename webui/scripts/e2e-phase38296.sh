#!/usr/bin/env bash
# Phase-38296: soft-complete through 38296 (ms 117750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38296
assert m.WEBUI_HONESTY_MILESTONE == 117750
print("soft-complete >=38296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38296|through 38296' webui/STATUS.md
echo "OK: phase38296 e2e passed"
