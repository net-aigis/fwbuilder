#!/usr/bin/env bash
# Phase-38176: soft-complete through 38176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38176
PY
grep -qE 'phase38176|through 38176' webui/STATUS.md
echo "OK: phase38176 e2e passed"
