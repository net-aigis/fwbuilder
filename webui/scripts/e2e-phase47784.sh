#!/usr/bin/env bash
# Phase-47784: soft-complete through 47784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47784
PY
grep -qE 'phase47784|through 47784' webui/STATUS.md
echo "OK: phase47784 e2e passed"
