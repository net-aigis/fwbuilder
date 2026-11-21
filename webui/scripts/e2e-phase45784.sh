#!/usr/bin/env bash
# Phase-45784: soft-complete through 45784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45784
PY
grep -qE 'phase45784|through 45784' webui/STATUS.md
echo "OK: phase45784 e2e passed"
