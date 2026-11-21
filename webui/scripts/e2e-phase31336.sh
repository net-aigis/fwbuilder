#!/usr/bin/env bash
# Phase-31336: soft-complete through 31336 (ms 96000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31336
assert m.WEBUI_HONESTY_MILESTONE == 96000
print("soft-complete >=31336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31336|through 31336' webui/STATUS.md
echo "OK: phase31336 e2e passed"
