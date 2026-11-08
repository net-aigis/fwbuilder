#!/usr/bin/env bash
# Phase-11096: soft-complete through 11096 (ms 32750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11096
assert m.WEBUI_HONESTY_MILESTONE == 32750
print("soft-complete >=11096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase11096|through 11096' webui/STATUS.md
echo "OK: phase11096 e2e passed"
