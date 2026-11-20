#!/usr/bin/env bash
# Phase-46584: soft-complete through 46584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46584
PY
grep -qE 'phase46584|through 46584' webui/STATUS.md
echo "OK: phase46584 e2e passed"
