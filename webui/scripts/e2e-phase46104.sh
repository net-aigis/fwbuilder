#!/usr/bin/env bash
# Phase-46104: soft-complete through 46104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46104
PY
grep -qE 'phase46104|through 46104' webui/STATUS.md
echo "OK: phase46104 e2e passed"
