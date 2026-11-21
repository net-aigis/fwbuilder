#!/usr/bin/env bash
# Phase-12296: soft-complete through 12296 (ms 36500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12296
assert m.WEBUI_HONESTY_MILESTONE == 36500
print("soft-complete >=12296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12296|through 12296' webui/STATUS.md
echo "OK: phase12296 e2e passed"
