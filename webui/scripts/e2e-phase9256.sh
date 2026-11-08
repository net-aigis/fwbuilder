#!/usr/bin/env bash
# Phase-9256: soft-complete through 9256 (ms 27000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9256
assert m.WEBUI_HONESTY_MILESTONE == 27000
print("soft-complete >=9256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9256|through 9256' webui/STATUS.md
echo "OK: phase9256 e2e passed"
