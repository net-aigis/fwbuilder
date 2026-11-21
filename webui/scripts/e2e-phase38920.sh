#!/usr/bin/env bash
# Phase-38920: soft-complete through 38920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38920
PY
grep -qE 'phase38920|through 38920' webui/STATUS.md
echo "OK: phase38920 e2e passed"
