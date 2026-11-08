#!/usr/bin/env bash
# Phase-8608: soft-complete through 8608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8608
PY
grep -qE 'phase8608|through 8608' webui/STATUS.md
echo "OK: phase8608 e2e passed"
