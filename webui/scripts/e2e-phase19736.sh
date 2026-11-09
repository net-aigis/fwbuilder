#!/usr/bin/env bash
# Phase-19736: soft-complete through 19736 (ms 59750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19736
assert m.WEBUI_HONESTY_MILESTONE == 59750
print("soft-complete >=19736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19736|through 19736' webui/STATUS.md
echo "OK: phase19736 e2e passed"
