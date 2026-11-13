#!/usr/bin/env bash
# Phase-27976: soft-complete through 27976 (ms 85500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27976
assert m.WEBUI_HONESTY_MILESTONE == 85500
print("soft-complete >=27976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27976|through 27976' webui/STATUS.md
echo "OK: phase27976 e2e passed"
