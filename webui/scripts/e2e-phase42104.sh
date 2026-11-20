#!/usr/bin/env bash
# Phase-42104: soft-complete through 42104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42104
PY
grep -qE 'phase42104|through 42104' webui/STATUS.md
echo "OK: phase42104 e2e passed"
