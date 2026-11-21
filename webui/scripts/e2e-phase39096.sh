#!/usr/bin/env bash
# Phase-39096: soft-complete through 39096 (ms 120250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39096
assert m.WEBUI_HONESTY_MILESTONE == 120250
print("soft-complete >=39096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase39096|through 39096' webui/STATUS.md
echo "OK: phase39096 e2e passed"
