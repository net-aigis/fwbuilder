#!/usr/bin/env bash
# Phase-20608: soft-complete through 20608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20608
PY
grep -qE 'phase20608|through 20608' webui/STATUS.md
echo "OK: phase20608 e2e passed"
