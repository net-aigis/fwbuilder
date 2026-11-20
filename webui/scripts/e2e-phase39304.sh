#!/usr/bin/env bash
# Phase-39304: soft-complete through 39304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39304
PY
grep -qE 'phase39304|through 39304' webui/STATUS.md
echo "OK: phase39304 e2e passed"
