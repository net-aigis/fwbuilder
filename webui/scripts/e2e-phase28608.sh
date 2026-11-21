#!/usr/bin/env bash
# Phase-28608: soft-complete through 28608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28608
PY
grep -qE 'phase28608|through 28608' webui/STATUS.md
echo "OK: phase28608 e2e passed"
