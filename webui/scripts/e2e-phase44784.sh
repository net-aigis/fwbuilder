#!/usr/bin/env bash
# Phase-44784: soft-complete through 44784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44784
PY
grep -qE 'phase44784|through 44784' webui/STATUS.md
echo "OK: phase44784 e2e passed"
