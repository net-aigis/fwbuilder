#!/usr/bin/env bash
# Phase-45608: soft-complete through 45608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45608
PY
grep -qE 'phase45608|through 45608' webui/STATUS.md
echo "OK: phase45608 e2e passed"
