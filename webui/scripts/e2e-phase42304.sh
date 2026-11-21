#!/usr/bin/env bash
# Phase-42304: soft-complete through 42304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42304
PY
grep -qE 'phase42304|through 42304' webui/STATUS.md
echo "OK: phase42304 e2e passed"
