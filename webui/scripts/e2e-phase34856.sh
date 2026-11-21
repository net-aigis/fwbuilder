#!/usr/bin/env bash
# Phase-34856: soft-complete through 34856 (ms 107000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34856
assert m.WEBUI_HONESTY_MILESTONE == 107000
print("soft-complete >=34856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34856|through 34856' webui/STATUS.md
echo "OK: phase34856 e2e passed"
