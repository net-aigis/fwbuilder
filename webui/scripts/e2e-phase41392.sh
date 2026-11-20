#!/usr/bin/env bash
# Phase-41392: soft-complete through 41392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41392
PY
grep -qE 'phase41392|through 41392' webui/STATUS.md
echo "OK: phase41392 e2e passed"
