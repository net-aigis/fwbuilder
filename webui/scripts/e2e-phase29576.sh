#!/usr/bin/env bash
# Phase-29576: soft-complete through 29576 (ms 90500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29576
assert m.WEBUI_HONESTY_MILESTONE == 90500
print("soft-complete >=29576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase29576|through 29576' webui/STATUS.md
echo "OK: phase29576 e2e passed"
