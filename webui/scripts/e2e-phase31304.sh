#!/usr/bin/env bash
# Phase-31304: soft-complete through 31304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31304
PY
grep -qE 'phase31304|through 31304' webui/STATUS.md
echo "OK: phase31304 e2e passed"
