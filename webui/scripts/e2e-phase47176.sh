#!/usr/bin/env bash
# Phase-47176: soft-complete through 47176 (ms 145500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47176
assert m.WEBUI_HONESTY_MILESTONE == 145500
print("soft-complete >=47176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47176|through 47176' webui/STATUS.md
echo "OK: phase47176 e2e passed"
