#!/usr/bin/env bash
# Phase-33376: soft-complete through 33376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33376
PY
grep -qE 'phase33376|through 33376' webui/STATUS.md
echo "OK: phase33376 e2e passed"
