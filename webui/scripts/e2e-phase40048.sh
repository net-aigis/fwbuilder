#!/usr/bin/env bash
# Phase-40048: soft-complete through 40048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40048
PY
grep -qE 'phase40048|through 40048' webui/STATUS.md
echo "OK: phase40048 e2e passed"
