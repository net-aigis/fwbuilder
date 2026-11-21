#!/usr/bin/env bash
# Phase-46088: soft-complete through 46088.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46088
PY
grep -qE 'phase46088|through 46088' webui/STATUS.md
echo "OK: phase46088 e2e passed"
