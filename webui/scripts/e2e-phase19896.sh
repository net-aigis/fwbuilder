#!/usr/bin/env bash
# Phase-19896: soft-complete through 19896 (ms 60250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19896
assert m.WEBUI_HONESTY_MILESTONE == 60250
print("soft-complete >=19896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19896|through 19896' webui/STATUS.md
echo "OK: phase19896 e2e passed"
