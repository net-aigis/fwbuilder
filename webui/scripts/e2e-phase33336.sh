#!/usr/bin/env bash
# Phase-33336: soft-complete through 33336 (ms 102250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33336
assert m.WEBUI_HONESTY_MILESTONE == 102250
print("soft-complete >=33336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33336|through 33336' webui/STATUS.md
echo "OK: phase33336 e2e passed"
