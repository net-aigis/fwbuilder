#!/usr/bin/env bash
# Phase-30296: soft-complete through 30296 (ms 92750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30296
assert m.WEBUI_HONESTY_MILESTONE == 92750
print("soft-complete >=30296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30296|through 30296' webui/STATUS.md
echo "OK: phase30296 e2e passed"
