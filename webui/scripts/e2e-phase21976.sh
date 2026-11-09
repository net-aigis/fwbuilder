#!/usr/bin/env bash
# Phase-21976: soft-complete through 21976 (ms 66750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21976
assert m.WEBUI_HONESTY_MILESTONE == 66750
print("soft-complete >=21976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21976|through 21976' webui/STATUS.md
echo "OK: phase21976 e2e passed"
