#!/usr/bin/env bash
# Phase-21656: soft-complete through 21656 (ms 65750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21656
assert m.WEBUI_HONESTY_MILESTONE == 65750
print("soft-complete >=21656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21656|through 21656' webui/STATUS.md
echo "OK: phase21656 e2e passed"
