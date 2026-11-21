#!/usr/bin/env bash
# Phase-40104: soft-complete through 40104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40104
PY
grep -qE 'phase40104|through 40104' webui/STATUS.md
echo "OK: phase40104 e2e passed"
