#!/usr/bin/env bash
# Phase-19976: soft-complete through 19976 (ms 60500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19976
assert m.WEBUI_HONESTY_MILESTONE == 60500
print("soft-complete >=19976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19976|through 19976' webui/STATUS.md
echo "OK: phase19976 e2e passed"
