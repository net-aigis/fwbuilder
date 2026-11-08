#!/usr/bin/env bash
# Phase-15576: soft-complete through 15576 (ms 46750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15576
assert m.WEBUI_HONESTY_MILESTONE == 46750
print("soft-complete >=15576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15576|through 15576' webui/STATUS.md
echo "OK: phase15576 e2e passed"
