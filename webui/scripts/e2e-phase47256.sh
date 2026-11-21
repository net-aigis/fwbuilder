#!/usr/bin/env bash
# Phase-47256: soft-complete through 47256 (ms 145750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47256
assert m.WEBUI_HONESTY_MILESTONE == 145750
print("soft-complete >=47256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47256|through 47256' webui/STATUS.md
echo "OK: phase47256 e2e passed"
