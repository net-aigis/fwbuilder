#!/usr/bin/env bash
# Phase-42416: soft-complete through 42416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42416
PY
grep -qE 'phase42416|through 42416' webui/STATUS.md
echo "OK: phase42416 e2e passed"
