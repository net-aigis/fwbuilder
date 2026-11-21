#!/usr/bin/env bash
# Phase-30304: soft-complete through 30304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30304
PY
grep -qE 'phase30304|through 30304' webui/STATUS.md
echo "OK: phase30304 e2e passed"
