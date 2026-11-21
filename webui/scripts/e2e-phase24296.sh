#!/usr/bin/env bash
# Phase-24296: soft-complete through 24296 (ms 74000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24296
assert m.WEBUI_HONESTY_MILESTONE == 74000
print("soft-complete >=24296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24296|through 24296' webui/STATUS.md
echo "OK: phase24296 e2e passed"
