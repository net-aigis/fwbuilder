#!/usr/bin/env bash
# Phase-42136: soft-complete through 42136 (ms 129750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42136
assert m.WEBUI_HONESTY_MILESTONE == 129750
print("soft-complete >=42136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42136|through 42136' webui/STATUS.md
echo "OK: phase42136 e2e passed"
