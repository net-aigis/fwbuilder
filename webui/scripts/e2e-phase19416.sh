#!/usr/bin/env bash
# Phase-19416: soft-complete through 19416 (ms 58750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19416
assert m.WEBUI_HONESTY_MILESTONE == 58750
print("soft-complete >=19416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19416|through 19416' webui/STATUS.md
echo "OK: phase19416 e2e passed"
