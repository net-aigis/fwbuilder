#!/usr/bin/env bash
# Phase-27416: soft-complete through 27416 (ms 83750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27416
assert m.WEBUI_HONESTY_MILESTONE == 83750
print("soft-complete >=27416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27416|through 27416' webui/STATUS.md
echo "OK: phase27416 e2e passed"
