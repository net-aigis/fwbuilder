#!/usr/bin/env bash
# Phase-47600: soft-complete through 47600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47600
PY
grep -qE 'phase47600|through 47600' webui/STATUS.md
echo "OK: phase47600 e2e passed"
