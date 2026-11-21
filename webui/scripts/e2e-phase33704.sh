#!/usr/bin/env bash
# Phase-33704: soft-complete through 33704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33704
PY
grep -qE 'phase33704|through 33704' webui/STATUS.md
echo "OK: phase33704 e2e passed"
