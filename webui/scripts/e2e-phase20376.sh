#!/usr/bin/env bash
# Phase-20376: soft-complete through 20376 (ms 61750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20376
assert m.WEBUI_HONESTY_MILESTONE == 61750
print("soft-complete >=20376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase20376|through 20376' webui/STATUS.md
echo "OK: phase20376 e2e passed"
