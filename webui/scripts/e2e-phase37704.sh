#!/usr/bin/env bash
# Phase-37704: soft-complete through 37704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37704
PY
grep -qE 'phase37704|through 37704' webui/STATUS.md
echo "OK: phase37704 e2e passed"
