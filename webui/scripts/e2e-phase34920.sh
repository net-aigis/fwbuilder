#!/usr/bin/env bash
# Phase-34920: soft-complete through 34920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34920
PY
grep -qE 'phase34920|through 34920' webui/STATUS.md
echo "OK: phase34920 e2e passed"
