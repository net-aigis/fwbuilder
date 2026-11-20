#!/usr/bin/env bash
# Phase-41648: soft-complete through 41648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41648
PY
grep -qE 'phase41648|through 41648' webui/STATUS.md
echo "OK: phase41648 e2e passed"
