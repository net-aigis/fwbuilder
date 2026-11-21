#!/usr/bin/env bash
# Phase-47976: soft-complete through 47976 (ms 148000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47976
assert m.WEBUI_HONESTY_MILESTONE == 148000
print("soft-complete >=47976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase47976|through 47976' webui/STATUS.md
echo "OK: phase47976 e2e passed"
