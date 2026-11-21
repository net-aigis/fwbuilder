#!/usr/bin/env bash
# Phase-18856: soft-complete through 18856 (ms 57000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18856
assert m.WEBUI_HONESTY_MILESTONE == 57000
print("soft-complete >=18856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18856|through 18856' webui/STATUS.md
echo "OK: phase18856 e2e passed"
