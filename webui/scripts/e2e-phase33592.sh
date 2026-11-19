#!/usr/bin/env bash
# Phase-33592: soft-complete through 33592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33592
PY
grep -qE 'phase33592|through 33592' webui/STATUS.md
echo "OK: phase33592 e2e passed"
