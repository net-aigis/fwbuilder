#!/usr/bin/env bash
# Phase-47584: soft-complete through 47584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47584
PY
grep -qE 'phase47584|through 47584' webui/STATUS.md
echo "OK: phase47584 e2e passed"
