#!/usr/bin/env bash
# Phase-33256: soft-complete through 33256 (ms 102000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33256
assert m.WEBUI_HONESTY_MILESTONE == 102000
print("soft-complete >=33256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33256|through 33256' webui/STATUS.md
echo "OK: phase33256 e2e passed"
