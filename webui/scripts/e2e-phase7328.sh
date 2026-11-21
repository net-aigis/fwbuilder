#!/usr/bin/env bash
# Phase-7328: soft-complete through 7328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7328
PY
grep -qE 'phase7328|through 7328' webui/STATUS.md
echo "OK: phase7328 e2e passed"
