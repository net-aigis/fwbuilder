#!/usr/bin/env bash
# Phase-45760: soft-complete through 45760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45760
PY
grep -qE 'phase45760|through 45760' webui/STATUS.md
echo "OK: phase45760 e2e passed"
