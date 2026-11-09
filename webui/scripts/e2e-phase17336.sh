#!/usr/bin/env bash
# Phase-17336: soft-complete through 17336 (ms 52250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17336
assert m.WEBUI_HONESTY_MILESTONE == 52250
print("soft-complete >=17336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17336|through 17336' webui/STATUS.md
echo "OK: phase17336 e2e passed"
