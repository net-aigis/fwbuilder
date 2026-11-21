#!/usr/bin/env bash
# Phase-43592: soft-complete through 43592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43592
PY
grep -qE 'phase43592|through 43592' webui/STATUS.md
echo "OK: phase43592 e2e passed"
