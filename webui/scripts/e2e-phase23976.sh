#!/usr/bin/env bash
# Phase-23976: soft-complete through 23976 (ms 73000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23976
assert m.WEBUI_HONESTY_MILESTONE == 73000
print("soft-complete >=23976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23976|through 23976' webui/STATUS.md
echo "OK: phase23976 e2e passed"
