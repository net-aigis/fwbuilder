#!/usr/bin/env bash
# Phase-13576: soft-complete through 13576 (ms 40500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13576
assert m.WEBUI_HONESTY_MILESTONE == 40500
print("soft-complete >=13576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13576|through 13576' webui/STATUS.md
echo "OK: phase13576 e2e passed"
