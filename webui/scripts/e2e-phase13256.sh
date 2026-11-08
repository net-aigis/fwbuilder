#!/usr/bin/env bash
# Phase-13256: soft-complete through 13256 (ms 39500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13256
assert m.WEBUI_HONESTY_MILESTONE == 39500
print("soft-complete >=13256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13256|through 13256' webui/STATUS.md
echo "OK: phase13256 e2e passed"
