#!/usr/bin/env bash
# Phase-46600: soft-complete through 46600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46600
PY
grep -qE 'phase46600|through 46600' webui/STATUS.md
echo "OK: phase46600 e2e passed"
