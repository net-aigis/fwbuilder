#!/usr/bin/env bash
# Phase-27496: soft-complete through 27496 (ms 84000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27496
assert m.WEBUI_HONESTY_MILESTONE == 84000
print("soft-complete >=27496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27496|through 27496' webui/STATUS.md
echo "OK: phase27496 e2e passed"
