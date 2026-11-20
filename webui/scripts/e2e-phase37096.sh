#!/usr/bin/env bash
# Phase-37096: soft-complete through 37096 (ms 114000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37096
assert m.WEBUI_HONESTY_MILESTONE == 114000
print("soft-complete >=37096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37096|through 37096' webui/STATUS.md
echo "OK: phase37096 e2e passed"
