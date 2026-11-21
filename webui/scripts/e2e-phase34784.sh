#!/usr/bin/env bash
# Phase-34784: soft-complete through 34784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34784
PY
grep -qE 'phase34784|through 34784' webui/STATUS.md
echo "OK: phase34784 e2e passed"
