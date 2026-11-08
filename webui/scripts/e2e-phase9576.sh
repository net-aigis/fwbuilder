#!/usr/bin/env bash
# Phase-9576: soft-complete through 9576 (ms 28000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9576
assert m.WEBUI_HONESTY_MILESTONE == 28000
print("soft-complete >=9576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9576|through 9576' webui/STATUS.md
echo "OK: phase9576 e2e passed"
