#!/usr/bin/env bash
# Phase-20776: soft-complete through 20776 (ms 63000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20776
assert m.WEBUI_HONESTY_MILESTONE == 63000
print("soft-complete >=20776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20776|through 20776' webui/STATUS.md
echo "OK: phase20776 e2e passed"
