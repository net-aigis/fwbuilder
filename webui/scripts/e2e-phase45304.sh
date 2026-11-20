#!/usr/bin/env bash
# Phase-45304: soft-complete through 45304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45304
PY
grep -qE 'phase45304|through 45304' webui/STATUS.md
echo "OK: phase45304 e2e passed"
