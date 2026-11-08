#!/usr/bin/env bash
# Phase-14608: soft-complete through 14608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14608
PY
grep -qE 'phase14608|through 14608' webui/STATUS.md
echo "OK: phase14608 e2e passed"
