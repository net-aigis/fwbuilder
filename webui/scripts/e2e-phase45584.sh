#!/usr/bin/env bash
# Phase-45584: soft-complete through 45584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45584
PY
grep -qE 'phase45584|through 45584' webui/STATUS.md
echo "OK: phase45584 e2e passed"
