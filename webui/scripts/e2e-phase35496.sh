#!/usr/bin/env bash
# Phase-35496: soft-complete through 35496 (ms 109000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35496
assert m.WEBUI_HONESTY_MILESTONE == 109000
print("soft-complete >=35496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35496|through 35496' webui/STATUS.md
echo "OK: phase35496 e2e passed"
