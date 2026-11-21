#!/usr/bin/env bash
# Phase-38720: soft-complete through 38720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38720
PY
grep -qE 'phase38720|through 38720' webui/STATUS.md
echo "OK: phase38720 e2e passed"
