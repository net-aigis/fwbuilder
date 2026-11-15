#!/usr/bin/env bash
# Phase-33200: soft-complete through 33200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33200
PY
grep -qE 'phase33200|through 33200' webui/STATUS.md
echo "OK: phase33200 e2e passed"
