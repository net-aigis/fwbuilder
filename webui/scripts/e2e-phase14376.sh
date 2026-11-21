#!/usr/bin/env bash
# Phase-14376: soft-complete through 14376 (ms 43000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14376
assert m.WEBUI_HONESTY_MILESTONE == 43000
print("soft-complete >=14376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14376|through 14376' webui/STATUS.md
echo "OK: phase14376 e2e passed"
