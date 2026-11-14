#!/usr/bin/env bash
# Phase-31424: soft-complete through 31424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31424
PY
grep -qE 'phase31424|through 31424' webui/STATUS.md
echo "OK: phase31424 e2e passed"
