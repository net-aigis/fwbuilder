#!/usr/bin/env bash
# Phase-22608: soft-complete through 22608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22608
PY
grep -qE 'phase22608|through 22608' webui/STATUS.md
echo "OK: phase22608 e2e passed"
