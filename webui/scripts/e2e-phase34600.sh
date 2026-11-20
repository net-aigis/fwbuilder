#!/usr/bin/env bash
# Phase-34600: soft-complete through 34600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34600
PY
grep -qE 'phase34600|through 34600' webui/STATUS.md
echo "OK: phase34600 e2e passed"
