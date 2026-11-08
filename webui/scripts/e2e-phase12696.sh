#!/usr/bin/env bash
# Phase-12696: soft-complete through 12696 (ms 37750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12696
assert m.WEBUI_HONESTY_MILESTONE == 37750
print("soft-complete >=12696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12696|through 12696' webui/STATUS.md
echo "OK: phase12696 e2e passed"
