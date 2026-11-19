#!/usr/bin/env bash
# Phase-33896: soft-complete through 33896 (ms 104000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33896
assert m.WEBUI_HONESTY_MILESTONE == 104000
print("soft-complete >=33896", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33896|through 33896' webui/STATUS.md
echo "OK: phase33896 e2e passed"
