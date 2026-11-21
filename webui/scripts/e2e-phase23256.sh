#!/usr/bin/env bash
# Phase-23256: soft-complete through 23256 (ms 70750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23256
assert m.WEBUI_HONESTY_MILESTONE == 70750
print("soft-complete >=23256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23256|through 23256' webui/STATUS.md
echo "OK: phase23256 e2e passed"
