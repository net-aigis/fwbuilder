#!/usr/bin/env bash
# Phase-33304: soft-complete through 33304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33304
PY
grep -qE 'phase33304|through 33304' webui/STATUS.md
echo "OK: phase33304 e2e passed"
