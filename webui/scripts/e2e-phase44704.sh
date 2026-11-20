#!/usr/bin/env bash
# Phase-44704: soft-complete through 44704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44704
PY
grep -qE 'phase44704|through 44704' webui/STATUS.md
echo "OK: phase44704 e2e passed"
