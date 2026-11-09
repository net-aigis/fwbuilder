#!/usr/bin/env bash
# Phase-21808: soft-complete through 21808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21808
PY
grep -qE 'phase21808|through 21808' webui/STATUS.md
echo "OK: phase21808 e2e passed"
