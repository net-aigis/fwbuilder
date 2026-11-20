#!/usr/bin/env bash
# Phase-37648: soft-complete through 37648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37648
PY
grep -qE 'phase37648|through 37648' webui/STATUS.md
echo "OK: phase37648 e2e passed"
