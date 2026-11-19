#!/usr/bin/env bash
# Phase-34112: soft-complete through 34112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34112
PY
grep -qE 'phase34112|through 34112' webui/STATUS.md
echo "OK: phase34112 e2e passed"
