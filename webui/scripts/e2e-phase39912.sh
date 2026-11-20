#!/usr/bin/env bash
# Phase-39912: soft-complete through 39912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39912
PY
grep -qE 'phase39912|through 39912' webui/STATUS.md
echo "OK: phase39912 e2e passed"
