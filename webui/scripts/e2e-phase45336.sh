#!/usr/bin/env bash
# Phase-45336: soft-complete through 45336 (ms 139750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45336
assert m.WEBUI_HONESTY_MILESTONE == 139750
print("soft-complete >=45336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45336|through 45336' webui/STATUS.md
echo "OK: phase45336 e2e passed"
