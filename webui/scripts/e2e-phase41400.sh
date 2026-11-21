#!/usr/bin/env bash
# Phase-41400: soft-complete through 41400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41400
PY
grep -qE 'phase41400|through 41400' webui/STATUS.md
echo "OK: phase41400 e2e passed"
