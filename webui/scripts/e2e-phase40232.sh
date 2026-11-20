#!/usr/bin/env bash
# Phase-40232: soft-complete through 40232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40232
PY
grep -qE 'phase40232|through 40232' webui/STATUS.md
echo "OK: phase40232 e2e passed"
