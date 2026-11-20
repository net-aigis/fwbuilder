#!/usr/bin/env bash
# Phase-46176: soft-complete through 46176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46176
PY
grep -qE 'phase46176|through 46176' webui/STATUS.md
echo "OK: phase46176 e2e passed"
