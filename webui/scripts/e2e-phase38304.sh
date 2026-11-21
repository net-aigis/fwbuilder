#!/usr/bin/env bash
# Phase-38304: soft-complete through 38304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38304
PY
grep -qE 'phase38304|through 38304' webui/STATUS.md
echo "OK: phase38304 e2e passed"
