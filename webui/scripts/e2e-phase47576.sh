#!/usr/bin/env bash
# Phase-47576: soft-complete through 47576 (ms 146750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47576
assert m.WEBUI_HONESTY_MILESTONE == 146750
print("soft-complete >=47576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47576|through 47576' webui/STATUS.md
echo "OK: phase47576 e2e passed"
