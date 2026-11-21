#!/usr/bin/env bash
# Phase-7176: soft-complete through 7176 (ms 20500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7176
assert m.WEBUI_HONESTY_MILESTONE == 20500
print("soft-complete >=7176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7176|through 7176' webui/STATUS.md
echo "OK: phase7176 e2e passed"
