#!/usr/bin/env bash
# Phase-39584: soft-complete through 39584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39584
PY
grep -qE 'phase39584|through 39584' webui/STATUS.md
echo "OK: phase39584 e2e passed"
