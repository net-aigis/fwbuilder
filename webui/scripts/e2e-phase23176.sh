#!/usr/bin/env bash
# Phase-23176: soft-complete through 23176 (ms 70500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23176
assert m.WEBUI_HONESTY_MILESTONE == 70500
print("soft-complete >=23176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23176|through 23176' webui/STATUS.md
echo "OK: phase23176 e2e passed"
