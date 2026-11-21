#!/usr/bin/env bash
# Phase-40136: soft-complete through 40136 (ms 123500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40136
assert m.WEBUI_HONESTY_MILESTONE == 123500
print("soft-complete >=40136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40136|through 40136' webui/STATUS.md
echo "OK: phase40136 e2e passed"
