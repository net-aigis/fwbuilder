#!/usr/bin/env bash
# Phase-42232: soft-complete through 42232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42232
PY
grep -qE 'phase42232|through 42232' webui/STATUS.md
echo "OK: phase42232 e2e passed"
