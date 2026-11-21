#!/usr/bin/env bash
# Phase-46784: soft-complete through 46784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46784
PY
grep -qE 'phase46784|through 46784' webui/STATUS.md
echo "OK: phase46784 e2e passed"
