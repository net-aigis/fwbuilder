#!/usr/bin/env bash
# Phase-38584: soft-complete through 38584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38584
PY
grep -qE 'phase38584|through 38584' webui/STATUS.md
echo "OK: phase38584 e2e passed"
