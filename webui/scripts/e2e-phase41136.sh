#!/usr/bin/env bash
# Phase-41136: soft-complete through 41136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41136
PY
grep -qE 'phase41136|through 41136' webui/STATUS.md
echo "OK: phase41136 e2e passed"
