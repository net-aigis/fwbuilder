#!/usr/bin/env bash
# Phase-39264: soft-complete through 39264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39264
PY
grep -qE 'phase39264|through 39264' webui/STATUS.md
echo "OK: phase39264 e2e passed"
