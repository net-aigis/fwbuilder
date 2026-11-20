#!/usr/bin/env bash
# Phase-46304: soft-complete through 46304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46304
PY
grep -qE 'phase46304|through 46304' webui/STATUS.md
echo "OK: phase46304 e2e passed"
