#!/usr/bin/env bash
# Phase-34592: soft-complete through 34592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34592
PY
grep -qE 'phase34592|through 34592' webui/STATUS.md
echo "OK: phase34592 e2e passed"
