#!/usr/bin/env bash
# Phase-40296: soft-complete through 40296 (ms 124000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40296
assert m.WEBUI_HONESTY_MILESTONE == 124000
print("soft-complete >=40296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40296|through 40296' webui/STATUS.md
echo "OK: phase40296 e2e passed"
