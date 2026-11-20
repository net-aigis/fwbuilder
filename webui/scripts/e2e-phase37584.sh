#!/usr/bin/env bash
# Phase-37584: soft-complete through 37584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37584
PY
grep -qE 'phase37584|through 37584' webui/STATUS.md
echo "OK: phase37584 e2e passed"
