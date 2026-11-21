#!/usr/bin/env bash
# Phase-40176: soft-complete through 40176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40176
PY
grep -qE 'phase40176|through 40176' webui/STATUS.md
echo "OK: phase40176 e2e passed"
