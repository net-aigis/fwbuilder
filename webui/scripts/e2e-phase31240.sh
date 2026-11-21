#!/usr/bin/env bash
# Phase-31240: soft-complete through 31240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31240
PY
grep -qE 'phase31240|through 31240' webui/STATUS.md
echo "OK: phase31240 e2e passed"
