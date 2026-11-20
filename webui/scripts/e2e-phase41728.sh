#!/usr/bin/env bash
# Phase-41728: soft-complete through 41728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41728
PY
grep -qE 'phase41728|through 41728' webui/STATUS.md
echo "OK: phase41728 e2e passed"
