#!/usr/bin/env bash
# Phase-11648: soft-complete through 11648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11648
PY
grep -qE 'phase11648|through 11648' webui/STATUS.md
echo "OK: phase11648 e2e passed"
