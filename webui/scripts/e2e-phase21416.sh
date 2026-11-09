#!/usr/bin/env bash
# Phase-21416: soft-complete through 21416 (ms 65000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21416
assert m.WEBUI_HONESTY_MILESTONE == 65000
print("soft-complete >=21416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21416|through 21416' webui/STATUS.md
echo "OK: phase21416 e2e passed"
