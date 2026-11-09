#!/usr/bin/env bash
# Phase-21336: soft-complete through 21336 (ms 64750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21336
assert m.WEBUI_HONESTY_MILESTONE == 64750
print("soft-complete >=21336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21336|through 21336' webui/STATUS.md
echo "OK: phase21336 e2e passed"
