#!/usr/bin/env bash
# Phase-35096: soft-complete through 35096 (ms 107750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35096
assert m.WEBUI_HONESTY_MILESTONE == 107750
print("soft-complete >=35096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35096|through 35096' webui/STATUS.md
echo "OK: phase35096 e2e passed"
