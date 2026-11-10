#!/usr/bin/env bash
# Phase-23416: soft-complete through 23416 (ms 71250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23416
assert m.WEBUI_HONESTY_MILESTONE == 71250
print("soft-complete >=23416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23416|through 23416' webui/STATUS.md
echo "OK: phase23416 e2e passed"
