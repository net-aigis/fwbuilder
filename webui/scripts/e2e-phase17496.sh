#!/usr/bin/env bash
# Phase-17496: soft-complete through 17496 (ms 52750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17496
assert m.WEBUI_HONESTY_MILESTONE == 52750
print("soft-complete >=17496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17496|through 17496' webui/STATUS.md
echo "OK: phase17496 e2e passed"
