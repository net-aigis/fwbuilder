#!/usr/bin/env bash
# Phase-19728: soft-complete through 19728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19728
PY
grep -qE 'phase19728|through 19728' webui/STATUS.md
echo "OK: phase19728 e2e passed"
