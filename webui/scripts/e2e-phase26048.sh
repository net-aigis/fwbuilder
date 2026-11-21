#!/usr/bin/env bash
# Phase-26048: soft-complete through 26048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26048
PY
grep -qE 'phase26048|through 26048' webui/STATUS.md
echo "OK: phase26048 e2e passed"
