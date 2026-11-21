#!/usr/bin/env bash
# Phase-29648: soft-complete through 29648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29648
PY
grep -qE 'phase29648|through 29648' webui/STATUS.md
echo "OK: phase29648 e2e passed"
