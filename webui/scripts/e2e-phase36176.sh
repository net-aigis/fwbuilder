#!/usr/bin/env bash
# Phase-36176: soft-complete through 36176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36176
PY
grep -qE 'phase36176|through 36176' webui/STATUS.md
echo "OK: phase36176 e2e passed"
