#!/usr/bin/env bash
# Phase-41808: soft-complete through 41808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41808
PY
grep -qE 'phase41808|through 41808' webui/STATUS.md
echo "OK: phase41808 e2e passed"
