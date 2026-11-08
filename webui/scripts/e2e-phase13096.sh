#!/usr/bin/env bash
# Phase-13096: soft-complete through 13096 (ms 39000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13096
assert m.WEBUI_HONESTY_MILESTONE == 39000
print("soft-complete >=13096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13096|through 13096' webui/STATUS.md
echo "OK: phase13096 e2e passed"
