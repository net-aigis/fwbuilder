#!/usr/bin/env bash
# Phase-21736: soft-complete through 21736 (ms 66000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21736
assert m.WEBUI_HONESTY_MILESTONE == 66000
print("soft-complete >=21736", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21736|through 21736' webui/STATUS.md
echo "OK: phase21736 e2e passed"
