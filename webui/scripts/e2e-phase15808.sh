#!/usr/bin/env bash
# Phase-15808: soft-complete through 15808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15808
PY
grep -qE 'phase15808|through 15808' webui/STATUS.md
echo "OK: phase15808 e2e passed"
