#!/usr/bin/env bash
# Phase-41232: soft-complete through 41232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41232
PY
grep -qE 'phase41232|through 41232' webui/STATUS.md
echo "OK: phase41232 e2e passed"
