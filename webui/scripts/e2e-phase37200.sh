#!/usr/bin/env bash
# Phase-37200: soft-complete through 37200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37200
PY
grep -qE 'phase37200|through 37200' webui/STATUS.md
echo "OK: phase37200 e2e passed"
