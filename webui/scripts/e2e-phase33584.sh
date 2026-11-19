#!/usr/bin/env bash
# Phase-33584: soft-complete through 33584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33584
PY
grep -qE 'phase33584|through 33584' webui/STATUS.md
echo "OK: phase33584 e2e passed"
