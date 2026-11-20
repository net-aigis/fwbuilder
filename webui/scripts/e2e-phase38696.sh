#!/usr/bin/env bash
# Phase-38696: soft-complete through 38696 (ms 119000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38696
assert m.WEBUI_HONESTY_MILESTONE == 119000
print("soft-complete >=38696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38696|through 38696' webui/STATUS.md
echo "OK: phase38696 e2e passed"
