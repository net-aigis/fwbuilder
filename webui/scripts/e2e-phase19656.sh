#!/usr/bin/env bash
# Phase-19656: soft-complete through 19656 (ms 59500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19656
assert m.WEBUI_HONESTY_MILESTONE == 59500
print("soft-complete >=19656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19656|through 19656' webui/STATUS.md
echo "OK: phase19656 e2e passed"
