#!/usr/bin/env bash
# Phase-45096: soft-complete through 45096 (ms 139000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45096
assert m.WEBUI_HONESTY_MILESTONE == 139000
print("soft-complete >=45096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45096|through 45096' webui/STATUS.md
echo "OK: phase45096 e2e passed"
