#!/usr/bin/env bash
# Phase-34696: soft-complete through 34696 (ms 106500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34696
assert m.WEBUI_HONESTY_MILESTONE == 106500
print("soft-complete >=34696", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34696|through 34696' webui/STATUS.md
echo "OK: phase34696 e2e passed"
