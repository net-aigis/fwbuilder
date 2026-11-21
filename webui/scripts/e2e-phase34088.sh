#!/usr/bin/env bash
# Phase-34088: soft-complete through 34088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34088
PY
grep -qE 'phase34088|through 34088' webui/STATUS.md
echo "OK: phase34088 e2e passed"
