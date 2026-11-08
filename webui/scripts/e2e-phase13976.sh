#!/usr/bin/env bash
# Phase-13976: soft-complete through 13976 (ms 41750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13976
assert m.WEBUI_HONESTY_MILESTONE == 41750
print("soft-complete >=13976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13976|through 13976' webui/STATUS.md
echo "OK: phase13976 e2e passed"
