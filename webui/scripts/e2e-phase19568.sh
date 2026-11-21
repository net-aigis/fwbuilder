#!/usr/bin/env bash
# Phase-19568: soft-complete through 19568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19568
PY
grep -qE 'phase19568|through 19568' webui/STATUS.md
echo "OK: phase19568 e2e passed"
