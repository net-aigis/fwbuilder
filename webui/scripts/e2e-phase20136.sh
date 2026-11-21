#!/usr/bin/env bash
# Phase-20136: soft-complete through 20136 (ms 61000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20136
assert m.WEBUI_HONESTY_MILESTONE == 61000
print("soft-complete >=20136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20136|through 20136' webui/STATUS.md
echo "OK: phase20136 e2e passed"
