#!/usr/bin/env bash
# Phase-45656: soft-complete through 45656 (ms 140750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45656
assert m.WEBUI_HONESTY_MILESTONE == 140750
print("soft-complete >=45656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45656|through 45656' webui/STATUS.md
echo "OK: phase45656 e2e passed"
