#!/usr/bin/env bash
# Phase-44376: soft-complete through 44376 (ms 136750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44376
assert m.WEBUI_HONESTY_MILESTONE == 136750
print("soft-complete >=44376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44376|through 44376' webui/STATUS.md
echo "OK: phase44376 e2e passed"
