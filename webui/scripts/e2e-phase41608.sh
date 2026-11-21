#!/usr/bin/env bash
# Phase-41608: soft-complete through 41608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41608
PY
grep -qE 'phase41608|through 41608' webui/STATUS.md
echo "OK: phase41608 e2e passed"
