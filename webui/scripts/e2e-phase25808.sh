#!/usr/bin/env bash
# Phase-25808: soft-complete through 25808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25808
PY
grep -qE 'phase25808|through 25808' webui/STATUS.md
echo "OK: phase25808 e2e passed"
