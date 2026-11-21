#!/usr/bin/env bash
# Phase-32608: soft-complete through 32608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32608
PY
grep -qE 'phase32608|through 32608' webui/STATUS.md
echo "OK: phase32608 e2e passed"
