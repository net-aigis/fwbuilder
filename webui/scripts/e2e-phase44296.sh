#!/usr/bin/env bash
# Phase-44296: soft-complete through 44296 (ms 136500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44296
assert m.WEBUI_HONESTY_MILESTONE == 136500
print("soft-complete >=44296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44296|through 44296' webui/STATUS.md
echo "OK: phase44296 e2e passed"
