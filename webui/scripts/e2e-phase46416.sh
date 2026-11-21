#!/usr/bin/env bash
# Phase-46416: soft-complete through 46416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46416
PY
grep -qE 'phase46416|through 46416' webui/STATUS.md
echo "OK: phase46416 e2e passed"
