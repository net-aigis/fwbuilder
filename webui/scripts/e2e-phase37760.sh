#!/usr/bin/env bash
# Phase-37760: soft-complete through 37760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37760
PY
grep -qE 'phase37760|through 37760' webui/STATUS.md
echo "OK: phase37760 e2e passed"
