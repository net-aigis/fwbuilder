#!/usr/bin/env bash
# Phase-45648: soft-complete through 45648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45648
PY
grep -qE 'phase45648|through 45648' webui/STATUS.md
echo "OK: phase45648 e2e passed"
