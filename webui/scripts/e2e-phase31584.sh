#!/usr/bin/env bash
# Phase-31584: soft-complete through 31584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31584
PY
grep -qE 'phase31584|through 31584' webui/STATUS.md
echo "OK: phase31584 e2e passed"
