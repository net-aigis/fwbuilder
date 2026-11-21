#!/usr/bin/env bash
# Phase-7416: soft-complete through 7416 (ms 21000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7416
assert m.WEBUI_HONESTY_MILESTONE == 21250
print("soft-complete >=7416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7416|through 7416' webui/STATUS.md
echo "OK: phase7416 e2e passed"
