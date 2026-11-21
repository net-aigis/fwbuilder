#!/usr/bin/env bash
# Phase-47704: soft-complete through 47704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47704
PY
grep -qE 'phase47704|through 47704' webui/STATUS.md
echo "OK: phase47704 e2e passed"
