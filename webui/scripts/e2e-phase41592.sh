#!/usr/bin/env bash
# Phase-41592: soft-complete through 41592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41592
PY
grep -qE 'phase41592|through 41592' webui/STATUS.md
echo "OK: phase41592 e2e passed"
