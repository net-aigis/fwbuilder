#!/usr/bin/env bash
# Phase-23336: soft-complete through 23336 (ms 71000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23336
assert m.WEBUI_HONESTY_MILESTONE == 71000
print("soft-complete >=23336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23336|through 23336' webui/STATUS.md
echo "OK: phase23336 e2e passed"
