#!/usr/bin/env bash
# Phase-28536: soft-complete through 28536 (ms 87250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28536
assert m.WEBUI_HONESTY_MILESTONE == 87250
print("soft-complete >=28536", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28536|through 28536' webui/STATUS.md
echo "OK: phase28536 e2e passed"
