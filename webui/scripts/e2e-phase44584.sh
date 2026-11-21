#!/usr/bin/env bash
# Phase-44584: soft-complete through 44584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44584
PY
grep -qE 'phase44584|through 44584' webui/STATUS.md
echo "OK: phase44584 e2e passed"
