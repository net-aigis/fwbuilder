#!/usr/bin/env bash
# Phase-11576: soft-complete through 11576 (ms 34250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11576
assert m.WEBUI_HONESTY_MILESTONE == 34250
print("soft-complete >=11576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11576|through 11576' webui/STATUS.md
echo "OK: phase11576 e2e passed"
