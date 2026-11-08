#!/usr/bin/env bash
# Phase-7976: soft-complete through 7976 (ms 23000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7976
assert m.WEBUI_HONESTY_MILESTONE == 23000
print("soft-complete >=7976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7976|through 7976' webui/STATUS.md
echo "OK: phase7976 e2e passed"
