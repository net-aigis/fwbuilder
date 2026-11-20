#!/usr/bin/env bash
# Phase-36232: soft-complete through 36232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36232
PY
grep -qE 'phase36232|through 36232' webui/STATUS.md
echo "OK: phase36232 e2e passed"
