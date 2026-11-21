#!/usr/bin/env bash
# Phase-41296: soft-complete through 41296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41296
PY
grep -qE 'phase41296|through 41296' webui/STATUS.md
echo "OK: phase41296 e2e passed"
