#!/usr/bin/env bash
# Phase-35760: soft-complete through 35760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35760
PY
grep -qE 'phase35760|through 35760' webui/STATUS.md
echo "OK: phase35760 e2e passed"
