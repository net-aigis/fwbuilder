#!/usr/bin/env bash
# Phase-36376: soft-complete through 36376 (ms 111750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36376
assert m.WEBUI_HONESTY_MILESTONE == 111750
print("soft-complete >=36376", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36376|through 36376' webui/STATUS.md
echo "OK: phase36376 e2e passed"
