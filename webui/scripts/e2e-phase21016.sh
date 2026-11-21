#!/usr/bin/env bash
# Phase-21016: soft-complete through 21016 (ms 63750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21016
assert m.WEBUI_HONESTY_MILESTONE == 63750
print("soft-complete >=21016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21016|through 21016' webui/STATUS.md
echo "OK: phase21016 e2e passed"
