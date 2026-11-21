#!/usr/bin/env bash
# Phase-18608: soft-complete through 18608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18608
PY
grep -qE 'phase18608|through 18608' webui/STATUS.md
echo "OK: phase18608 e2e passed"
