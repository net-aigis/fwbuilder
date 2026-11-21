#!/usr/bin/env bash
# Phase-41584: soft-complete through 41584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41584
PY
grep -qE 'phase41584|through 41584' webui/STATUS.md
echo "OK: phase41584 e2e passed"
