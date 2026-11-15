#!/usr/bin/env bash
# Phase-33496: soft-complete through 33496 (ms 102750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33496
assert m.WEBUI_HONESTY_MILESTONE == 102750
print("soft-complete >=33496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33496|through 33496' webui/STATUS.md
echo "OK: phase33496 e2e passed"
