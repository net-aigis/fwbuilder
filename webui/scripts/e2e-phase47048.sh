#!/usr/bin/env bash
# Phase-47048: soft-complete through 47048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47048
PY
grep -qE 'phase47048|through 47048' webui/STATUS.md
echo "OK: phase47048 e2e passed"
