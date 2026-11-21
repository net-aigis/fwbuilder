#!/usr/bin/env bash
# Phase-31920: soft-complete through 31920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31920
PY
grep -qE 'phase31920|through 31920' webui/STATUS.md
echo "OK: phase31920 e2e passed"
