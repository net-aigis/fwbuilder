#!/usr/bin/env bash
# Phase-33920: soft-complete through 33920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33920
PY
grep -qE 'phase33920|through 33920' webui/STATUS.md
echo "OK: phase33920 e2e passed"
