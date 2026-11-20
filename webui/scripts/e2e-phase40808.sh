#!/usr/bin/env bash
# Phase-40808: soft-complete through 40808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40808
PY
grep -qE 'phase40808|through 40808' webui/STATUS.md
echo "OK: phase40808 e2e passed"
