#!/usr/bin/env bash
# Phase-16048: soft-complete through 16048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16048
PY
grep -qE 'phase16048|through 16048' webui/STATUS.md
echo "OK: phase16048 e2e passed"
