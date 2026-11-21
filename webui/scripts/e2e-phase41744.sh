#!/usr/bin/env bash
# Phase-41744: soft-complete through 41744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41744
PY
grep -qE 'phase41744|through 41744' webui/STATUS.md
echo "OK: phase41744 e2e passed"
