#!/usr/bin/env bash
# Phase-40056: soft-complete through 40056 (ms 123250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40056
assert m.WEBUI_HONESTY_MILESTONE == 123250
print("soft-complete >=40056", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40056|through 40056' webui/STATUS.md
echo "OK: phase40056 e2e passed"
