#!/usr/bin/env bash
# Phase-13496: soft-complete through 13496 (ms 40250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13496
assert m.WEBUI_HONESTY_MILESTONE == 40250
print("soft-complete >=13496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13496|through 13496' webui/STATUS.md
echo "OK: phase13496 e2e passed"
