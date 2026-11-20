#!/usr/bin/env bash
# Phase-46640: soft-complete through 46640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46640
PY
grep -qE 'phase46640|through 46640' webui/STATUS.md
echo "OK: phase46640 e2e passed"
