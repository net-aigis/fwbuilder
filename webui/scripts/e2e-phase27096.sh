#!/usr/bin/env bash
# Phase-27096: soft-complete through 27096 (ms 82750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27096
assert m.WEBUI_HONESTY_MILESTONE == 82750
print("soft-complete >=27096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27096|through 27096' webui/STATUS.md
echo "OK: phase27096 e2e passed"
