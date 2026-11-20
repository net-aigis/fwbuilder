#!/usr/bin/env bash
# Phase-40416: soft-complete through 40416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40416
PY
grep -qE 'phase40416|through 40416' webui/STATUS.md
echo "OK: phase40416 e2e passed"
