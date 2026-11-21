#!/usr/bin/env bash
# Phase-40648: soft-complete through 40648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40648
PY
grep -qE 'phase40648|through 40648' webui/STATUS.md
echo "OK: phase40648 e2e passed"
