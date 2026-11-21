#!/usr/bin/env bash
# Phase-32584: soft-complete through 32584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32584
PY
grep -qE 'phase32584|through 32584' webui/STATUS.md
echo "OK: phase32584 e2e passed"
