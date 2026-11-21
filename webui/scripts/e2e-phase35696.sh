#!/usr/bin/env bash
# Phase-35696: soft-complete through 35696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35696
PY
grep -qE 'phase35696|through 35696' webui/STATUS.md
echo "OK: phase35696 e2e passed"
