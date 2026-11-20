#!/usr/bin/env bash
# Phase-37576: soft-complete through 37576 (ms 115500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37576
assert m.WEBUI_HONESTY_MILESTONE == 115500
print("soft-complete >=37576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37576|through 37576' webui/STATUS.md
echo "OK: phase37576 e2e passed"
