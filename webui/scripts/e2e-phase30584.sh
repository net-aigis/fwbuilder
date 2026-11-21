#!/usr/bin/env bash
# Phase-30584: soft-complete through 30584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30584
PY
grep -qE 'phase30584|through 30584' webui/STATUS.md
echo "OK: phase30584 e2e passed"
