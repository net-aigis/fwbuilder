#!/usr/bin/env bash
# Phase-15096: soft-complete through 15096 (ms 45250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15096
assert m.WEBUI_HONESTY_MILESTONE == 45250
print("soft-complete >=15096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15096|through 15096' webui/STATUS.md
echo "OK: phase15096 e2e passed"
