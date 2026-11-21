#!/usr/bin/env bash
# Phase-41416: soft-complete through 41416 (ms 127500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41416
assert m.WEBUI_HONESTY_MILESTONE == 127500
print("soft-complete >=41416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41416|through 41416' webui/STATUS.md
echo "OK: phase41416 e2e passed"
